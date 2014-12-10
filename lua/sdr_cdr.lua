sdr_cdr = Proto ("sdr_cdr","sdr cdr")



local little_cdr_types_Array = { 
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
 
 

local f_sdr_xdr_interface = ProtoField.uint8("sdr.xdr.INTERFACE", "INTERFACE", base.DEC, little_cdr_types_Array)
local f_sdr_xdr_id_time = ProtoField.uint64("sdr.xdr.SDRIDTime", "SDRIDTime", base.DEC)
local f_sdr_xdr_id_index = ProtoField.uint64("sdr.xdr.SDRIDIndex", "SDRIDIndex", base.DEC)
local f_sdr_xdr_procedure_type = ProtoField.uint8("sdr.xdr.PROCEDURE_TYPE", "PROCEDURE_TYPE", base.DEC)
local f_sdr_xdr_starttime = ProtoField.uint64("sdr.xdr.StartTime", "StartTime", base.DEC)
local f_sdr_xdr_endtime = ProtoField.uint64("sdr.xdr.EndTime", "EndTime", base.DEC)
local f_sdr_xdr_startlocation_longitude = ProtoField.uint64("sdr.xdr.STARTLOCATION_LONGITUDE", "STARTLOCATION_LONGITUDE", base.DEC)
local f_sdr_xdr_startlocation_latitude = ProtoField.uint64("sdr.xdr.STARTLOCATION_LATITUDE", "STARTLOCATION_LATITUDE", base.DEC)
local f_sdr_xdr_endlocation_longitude = ProtoField.uint64("sdr.xdr.ENDLOCATION_LONGITUDE", "ENDLOCATION_LONGITUDE", base.DEC)
local f_sdr_xdr_endlocation_latitude = ProtoField.uint64("sdr.xdr.ENDLOCATION_LATITUDE", "ENDLOCATION_LATITUDE", base.DEC)
local f_sdr_xdr_procedure_status = ProtoField.uint8("sdr.xdr.PROCEDURE_STATUS", "PROCEDURE_STATUS", base.DEC)
local f_sdr_xdr_cause = ProtoField.uint8("sdr.xdr.CAUSE", "CAUSE", base.DEC)






sdr_cdr.fields = { 
    f_sdr_xdr_interface,
    f_sdr_xdr_id_time,
    f_sdr_xdr_id_index,
    f_sdr_xdr_procedure_type,
    f_sdr_xdr_starttime,
    f_sdr_xdr_endtime,
    f_sdr_xdr_startlocation_longitude,
    f_sdr_xdr_startlocation_latitude,
    f_sdr_xdr_endlocation_longitude,
    f_sdr_xdr_endlocation_latitude,
    f_sdr_xdr_procedure_status,
    f_sdr_xdr_cause,
}



function parseSDR_XDR(buffer,pinfo,tree)
	local buffer_len = buffer:len()
    local offset = 0

    local interface = buffer(offset,1):uint()
    local xdr_name = little_cdr_types_Array[interface]
    local xdrTree = tree:add(sdr_cdr, buffer(0, 68), string.format("%s", xdr_name))

	xdrTree:add(f_sdr_xdr_interface, buffer(offset,1))
    offset = offset + 1
	xdrTree:add(f_sdr_xdr_id_time, buffer(offset,8))
    offset = offset + 8
	xdrTree:add(f_sdr_xdr_id_index, buffer(offset,8))
    offset = offset + 8
	xdrTree:add(f_sdr_xdr_procedure_type, buffer(offset,1))
    offset = offset + 1
	xdrTree:add(f_sdr_xdr_starttime, buffer(offset,8))
    offset = offset + 8
	xdrTree:add(f_sdr_xdr_endtime, buffer(offset,8))
    offset = offset + 8
	xdrTree:add(f_sdr_xdr_startlocation_longitude, buffer(offset,8))
    offset = offset + 8
	xdrTree:add(f_sdr_xdr_startlocation_latitude, buffer(offset,8))
    offset = offset + 8
	xdrTree:add(f_sdr_xdr_endlocation_longitude, buffer(offset,8))
    offset = offset + 8
	xdrTree:add(f_sdr_xdr_endlocation_latitude, buffer(offset,8))
    offset = offset + 8
	xdrTree:add(f_sdr_xdr_procedure_status, buffer(offset,1))
    offset = offset + 1
	xdrTree:add(f_sdr_xdr_cause, buffer(offset,1))
    offset = offset + 1

    return offset;
end



function sdr_cdr.dissector(buffer,pinfo,tree)
	pinfo.cols.protocol:set("SDR_CDR")
	local buffer_len = buffer:len()
    local offset = 0

    while offset < buffer_len do
        offset = offset + parseSDR_XDR(buffer(offset, (buffer_len-offset)),pinfo,tree)
    end
    
    return
end     
        
local temptable = DissectorTable.get("ldap.name")
temptable:add("sdr_cdr", sdr_cdr)


