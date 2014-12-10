sdr = Proto ("sdr","sdr")


local sdr_proc_type_Array =
{
    [1] = "Attach",
    [2] = "Sevice Request",
    [3] = "Paging",
    [4] = "TAU",
    [5] = "Detach",
    [6] = "PDN connectivity",
    [7] = "PDN disconnection",
    [8] = "EPS bearer resource allocation",
    [9] = "EPS bearer resource modify",
    [10] = "EPS bearer context deactivation",
    [11] = "EPS bearer context modification",
    [12] = "Dedicated EPS bearer context activation",
    [13] = "X2 handover",
    [14] = "S1 handover",
    [15] = "UE Context Release",
    [16] = "EPS bearer Release",
    [17] = "CSFB",
}

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
 
 
--common head
local f_sdr_length = ProtoField.uint16("sdr.SDRLength", "CDRLength", base.DEC)
local f_sdr_city = ProtoField.uint16("sdr.CITY", "CITY", base.DEC)
local f_sdr_rat = ProtoField.uint8("sdr.RAT", "RAT", base.DEC)
local f_sdr_type = ProtoField.uint8("sdr.SDRTYPE", "SDRTYPE", base.DEC)
local f_sdr_id_time = ProtoField.uint64("sdr.SDRIDTime", "SDRIDTime", base.DEC)
local f_sdr_id_index = ProtoField.uint64("sdr.SDRIDIndex", "SDRIDIndex", base.DEC)
local f_sdr_imsi = ProtoField.bytes("sdr.IMSI", "IMSI")
local f_sdr_imei = ProtoField.bytes("sdr.IMEI", "IMEI")
local f_sdr_msisdn = ProtoField.bytes("sdr.MSISDN", "MSISDN")
-- sdr head
local f_sdr_procedure_type = ProtoField.uint8("sdr.ProcedureType", "ProcedureType", base.DEC, sdr_proc_type_Array)
local f_sdr_starttime = ProtoField.uint64("sdr.StartTime", "StartTime", base.DEC)
local f_sdr_endtime = ProtoField.uint64("sdr.EndTime", "EndTime", base.DEC)
local f_sdr_startlocation_longitude = ProtoField.uint64("sdr.STARTLOCATION_LONGITUDE", "STARTLOCATION_LONGITUDE", base.DEC)
local f_sdr_startlocation_latitude = ProtoField.uint64("sdr.STARTLOCATION_LATITUDE", "STARTLOCATION_LATITUDE", base.DEC)
local f_sdr_endlocation_longitude = ProtoField.uint64("sdr.ENDLOCATION_LONGITUDE", "ENDLOCATION_LONGITUDE", base.DEC)
local f_sdr_endlocation_latitude = ProtoField.uint64("sdr.ENDLOCATION_LATITUDE", "ENDLOCATION_LATITUDE", base.DEC)
local f_sdr_procedure_status = ProtoField.uint8("sdr.ProcedureStatus", "ProcedureStatus", base.DEC)
local f_sdr_failure_interface = ProtoField.uint8("sdr.FAILURE_INTERFACE", "FAILURE_INTERFACE", base.DEC)
local f_sdr_failure_cause = ProtoField.uint16("sdr.FAILURE_CAUSE", "FAILURE_CAUSE", base.DEC)
local f_sdr_keyword = ProtoField.uint8("sdr.KEYWORD", "KEYWORD", base.DEC)
local f_sdr_enb_id = ProtoField.uint32("sdr.ENB_ID", "ENB_ID", base.DEC)
local f_sdr_cell_id = ProtoField.uint32("sdr.CELL_ID", "CELL_ID", base.DEC)
local f_sdr_mme_group_id = ProtoField.uint16("sdr.MME_GROUP_ID", "MME_GROUP_ID", base.DEC)
local f_sdr_mme_code = ProtoField.uint8("sdr.MME_CODE", "MME_CODE", base.DEC)
local f_sdr_tac = ProtoField.uint16("sdr.TAC", "TAC", base.DEC)
local f_sdr_user_ipv4 = ProtoField.uint32("sdr.USER_IPV4", "USER_IPV4", base.DEC)
local f_sdr_user_ipv6 = ProtoField.bytes("sdr.USER_IPV6", "USER_IPV6", base.DEC)
local f_sdr_new_enb_id = ProtoField.uint32("sdr.NEW_ENB_ID", "NEW_ENB_ID", base.DEC)
local f_sdr_new_cell_id = ProtoField.uint32("sdr.NEW_CELL_ID", "NEW_CELL_ID", base.DEC)
local f_sdr_new_mme_group_id = ProtoField.uint16("sdr.NEW_MME_GROUP_ID", "NEW_MME_GROUP_ID", base.DEC)
local f_sdr_new_mme_code = ProtoField.uint8("sdr.NEW_MME_CODE", "NEW_MME_CODE", base.DEC)
local f_sdr_new_tac = ProtoField.uint16("sdr.NEW_TAC", "NEW_TAC", base.DEC)
local f_sdr_eps_bearer_number = ProtoField.uint8("sdr.EPS_BEARER_NUMBER", "EPS_BEARER_NUMBER", base.DEC)
local f_sdr_bearer_id = ProtoField.uint8("sdr.BEARER_ID", "BEARER_ID", base.DEC)
local f_sdr_bearer_type = ProtoField.uint8("sdr.BEARER_TYPE", "BEARER_TYPE", base.DEC)
local f_sdr_bearer_qci = ProtoField.uint8("sdr.BEARER_QCI", "BEARER_QCI", base.DEC)
local f_sdr_bearer_status = ProtoField.uint8("sdr.BEARER_STATUS", "BEARER_STATUS", base.DEC)
local f_sdr_bearer_enb_gtp_teid = ProtoField.uint32("sdr.BEARER_ENB_GTP_TEID", "BEARER_ENB_GTP_TEID", base.DEC)
local f_sdr_bearer_sgw_gtp_teid = ProtoField.uint32("sdr.BEARER_SGW_GTP_TEID", "BEARER_SGW_GTP_TEID", base.DEC)

--cdrs
local f_sdr_xdrnumber = ProtoField.uint8("sdr.XDRNUMBER", "XDRNUMBER", base.DEC)

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






sdr.fields = { 
    f_sdr_length,
    f_sdr_city,
    f_sdr_rat,
    f_sdr_type,
    f_sdr_id_time,
    f_sdr_id_index,
    f_sdr_imsi,
    f_sdr_imei,
    f_sdr_msisdn,
    f_sdr_procedure_type,
    f_sdr_starttime,
    f_sdr_endtime,
    f_sdr_startlocation_longitude,
    f_sdr_startlocation_latitude,
    f_sdr_endlocation_longitude,
    f_sdr_endlocation_latitude,
    f_sdr_procedure_status,
    f_sdr_failure_interface,
    f_sdr_failure_cause,
    f_sdr_keyword,
    f_sdr_enb_id,
    f_sdr_cell_id,
    f_sdr_mme_group_id,
    f_sdr_mme_code,
    f_sdr_tac,
    f_sdr_user_ipv4,
    f_sdr_user_ipv6,
    f_sdr_new_enb_id,
    f_sdr_new_cell_id,
    f_sdr_new_mme_group_id,
    f_sdr_new_mme_code,
    f_sdr_new_tac,
    f_sdr_eps_bearer_number,
    f_sdr_bearer_id,
    f_sdr_bearer_type,
    f_sdr_bearer_qci,
    f_sdr_bearer_status,
    f_sdr_bearer_enb_gtp_teid,
    f_sdr_bearer_sgw_gtp_teid,
    f_sdr_xdrnumber,
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

function parseSDR_EPS_Bear(buffer,pinfo,tree, index)
	local buffer_len = buffer:len()
    local offset = 0

    local bearTree = tree:add(sdr, buffer(0, 12), string.format("EPS Bear %d", index))

	bearTree:add(f_sdr_bearer_id, buffer(offset,1))
    offset = offset + 1
	bearTree:add(f_sdr_bearer_type, buffer(offset,1))
    offset = offset + 1
	bearTree:add(f_sdr_bearer_qci, buffer(offset,1))
    offset = offset + 1
	bearTree:add(f_sdr_bearer_status, buffer(offset,1))
    offset = offset + 1
	bearTree:add(f_sdr_bearer_enb_gtp_teid, buffer(offset,4))
    offset = offset + 4
	bearTree:add(f_sdr_bearer_sgw_gtp_teid, buffer(offset,4))
    offset = offset + 4
    
    return offset;
end


function parseSDR_XDR(buffer,pinfo,tree)
	local buffer_len = buffer:len()
    local offset = 0

    local interface = buffer(offset,1):uint()
    local xdr_name = little_cdr_types_Array[interface]
    local xdrTree = tree:add(sdr, buffer(0, 68), string.format("%s", xdr_name))

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



-- parse sdr
function parseSDR(buffer,pinfo,tree)
	local buffer_len = buffer:len()
    local offset = 0
--head
	tree:add(f_sdr_length, buffer(offset,2))
    offset = offset + 2
	tree:add(f_sdr_city, buffer(offset,2))
    offset = offset + 2
	tree:add(f_sdr_rat, buffer(offset,1))
    offset = offset + 1
	tree:add(f_sdr_type, buffer(offset,1))
    offset = offset + 1
	tree:add(f_sdr_id_time, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_id_index, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_imsi, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_imei, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_msisdn, buffer(offset,16))
    offset = offset + 16
--sdr
	tree:add(f_sdr_procedure_type, buffer(offset,1))
    offset = offset + 1
	tree:add(f_sdr_starttime, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_endtime, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_startlocation_longitude, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_startlocation_latitude, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_endlocation_longitude, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_endlocation_latitude, buffer(offset,8))
    offset = offset + 8
	tree:add(f_sdr_procedure_status, buffer(offset,1))
    offset = offset + 1
	tree:add(f_sdr_failure_interface, buffer(offset,1))
    offset = offset + 1
	tree:add(f_sdr_failure_cause, buffer(offset,2))
    offset = offset + 2
	tree:add(f_sdr_keyword, buffer(offset,1))
    offset = offset + 1
	tree:add(f_sdr_enb_id, buffer(offset,4))
    offset = offset + 4
	tree:add(f_sdr_cell_id, buffer(offset,4))
    offset = offset + 4
	tree:add(f_sdr_mme_group_id, buffer(offset,2))
    offset = offset + 2
	tree:add(f_sdr_mme_code, buffer(offset,1))
    offset = offset + 1
	tree:add(f_sdr_tac, buffer(offset,2))
    offset = offset + 2
	tree:add(f_sdr_user_ipv4, buffer(offset,4))
    offset = offset + 4
	tree:add(f_sdr_user_ipv6, buffer(offset,16))
    offset = offset + 16
	tree:add(f_sdr_new_enb_id, buffer(offset,4))
    offset = offset + 4
	tree:add(f_sdr_new_cell_id, buffer(offset,4))
    offset = offset + 4
	tree:add(f_sdr_new_mme_group_id, buffer(offset,2))
    offset = offset + 2
	tree:add(f_sdr_new_mme_code, buffer(offset,1))
    offset = offset + 1
	tree:add(f_sdr_new_tac, buffer(offset,2))
    offset = offset + 2
	tree:add(f_sdr_eps_bearer_number, buffer(offset,1))
    offset = offset + 1

    local index = 1

    for index=1,11 do
        offset = offset + parseSDR_EPS_Bear(buffer(offset, (buffer_len-offset)),pinfo,tree, index)
    end

--xdrs
    local xdrnumber = buffer(offset,1):uint()
	tree:add(f_sdr_xdrnumber, buffer(offset,1))
    offset = offset + 1

    for index=1,xdrnumber do
        if offset == buffer_len then
            break;
        end
        offset = offset + parseSDR_XDR(buffer(offset, (buffer_len-offset)),pinfo,tree)
    end
end   

function sdr.dissector(buffer,pinfo,tree)
	pinfo.cols.protocol:set("SDR")
	local buffer_len = buffer:len()

    local myTree = tree:add(sdr, buffer(0, buffer_len), string.format("SDR"))
    parseSDR(buffer(0, buffer_len),pinfo,myTree)
    
    return
end     
        
local temptable = DissectorTable.get("ldap.name")
temptable:add("sdr", sdr)


