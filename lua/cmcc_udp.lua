cmcc_udp_proto = Proto ("cmcc_udp","cmcc udp","cmcc udp interface")


local msg_type_Array = { 
    [1] = "CDR", 
    [2] = "RAW Packet",  
    [3] = "Backfilled CDR" , 
    [4] = "SDR" , 
}


local little_cdr_types = { 
    [1] = "cdr_uu",
    [2] = "cdr_x2",
    [3] = "cdr_ue_mr",
    [4] = "cdr_cell_mr",
    [5] = "cdr_s1_mme",
    [6] = "cdr_s6a",
    [7] = "cdr_s11",
    [8] = "cdr_s10",
    [9] = "cdr_sgs",
    [10] = "cdr_s5s8",
    [11] = "cdr_s1_u",
    [12] = "cdr_gn_c",
}

 

--udp header
local f_total_len = ProtoField.uint16("cmcc_udp.totallength", "TotalLength", base.DEC)
local f_msg_type = ProtoField.uint16("cmcc_udp.msgtype", "MsgType", base.DEC, msg_type_Array)
local f_seq_id = ProtoField.uint16("cmcc_udp.sequenceid", "SequenceId", base.DEC)
local f_fragment = ProtoField.uint32("cmcc_udp.fragement", "Fragement", base.DEC)


cmcc_udp_proto.fields = { f_total_len, f_msg_type, f_seq_id, f_fragment }


function parsePacket(buffer,pinfo,tree)
	local buffer_len = buffer:len()
    local offset = 0
    local myTree = tree:add(cmcc_udp_proto, buffer(0, buffer_len), string.format("cmcc udp header"))

	myTree:add(f_total_len, buffer(offset,2))
    offset = offset + 2
	local msg_type = buffer(offset, 2):uint()
	myTree:add(f_msg_type, buffer(offset,2))
    offset = offset + 2
	myTree:add(f_seq_id, buffer(offset,2))
    offset = offset + 2
    --reserve
    offset = offset + 2
    local fragement_offset = buffer(offset+1,3):uint()
	myTree:add(f_fragment, buffer(offset,4))
    offset = offset + 4

    local temptable = DissectorTable.get("ldap.name")
    if msg_type == 0x1 or msg_type == 0x3 then 
        local interface_type = buffer(offset+4, 1):uint()
        temptable:try(little_cdr_types[interface_type], buffer(offset, (buffer_len-offset)):tvb(),pinfo,tree)
    elseif msg_type == 0x4 then
        if fragement_offset == 0 then
            temptable:try(string.format("sdr"), buffer(offset, (buffer_len-offset)):tvb(),pinfo,tree)
        else 
            temptable:try(string.format("sdr_cdr"), buffer(offset, (buffer_len-offset)):tvb(),pinfo,tree)
        end
    end

	
	return 
end


function cmcc_udp_proto.dissector(buffer,pinfo,tree)
	pinfo.cols.protocol:set("CDR")
	local buffer_len = buffer:len()
	local total_len = 0
	
    if(buffer_len < 2) then return end
    total_len = buffer(0,2):uint()
    if(buffer_len < total_len) then return end
    
    parsePacket(buffer(0, total_len),pinfo,tree)
    return
end     
        
local udp_port_table = DissectorTable.get("udp.port")
for i,port in ipairs{2000,9501} do
	udp_port_table:add(port,cmcc_udp_proto)
end
