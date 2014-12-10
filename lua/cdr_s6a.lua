cdr_s6a = Proto ("s6a","cdr_s6a")


 
local s6a_proc_type_Array = 
{
[0x0001] = "Update_Location", [0x0002] = "Cancel_Location", [0x0003] = "Purget_UE", [0x0004] = "Insert_Subscriber_Data",
[0x0005] = "Delete_Subscriber_Data", [0x0006] = "Authentication_Information", [0x0007] = "Reset", [0x0008] = "Notification"
}

local s6a_subscirber_status_Array = 
{
[0x000] = "SERVICE_GRANTED", [0x0001] = "OPERATOR_DETERMINED_BARRING", [0x00FF] = "INVALID_FIELD"
}

local s6a_access_restriction_data_Array = 
{
[0x0000] = "UTRAN Not Allowed", [0x0001] = "GERAN Not Allowed", [0x0002] = "GAN Not Allowed", [0x0003] = "I-HSPA-Evolution Not Allowed",
[0x0004] = "E-UTRAN Not Allowed", [0x0005] = "HO-T-Non-3GPP-Access Not Allowed", [0x00FF] = "INVALID_FIELD" 
}

local s6a_result_code_Array = 
{
[2001] = "DIAMETER_SUCCESS", [5001] = "DIAMETER_ERROR_USER_UNKNOWN", [5420] = "DIAMETER_ERROR_UNKNOWN_EPS_SUBSCRIPTION",
[5421] = "DIAMETER_ERROR_RAT_NOT_ALLOWED", [5004] = "DIAMETER_ERROR_ROAMING_NOT_ALLOWED"
}

--head
local f_s6a_cdr_len = ProtoField.uint16("CDRLength", "CDRLength", base.DEC)
local f_s6a_city = ProtoField.uint16("CITY", "CITY", base.DEC)
local f_s6a_Interface = ProtoField.uint8("Interface", "Interface", base.DEC)
local f_s6a_xdr_id_time = ProtoField.uint64("XDRIDTime", "XDRIDTime", base.DEC)
local f_s6a_xdr_id_index = ProtoField.uint64("XDRIDIndex", "XDRIDIndex", base.DEC)
local f_s6a_rat = ProtoField.uint8("RAT", "RAT", base.DEC)
local f_s6a_imsi = ProtoField.bytes("IMSI", "IMSI")
local f_s6a_imei = ProtoField.bytes("IMEI", "IMEI")
local f_s6a_msisdn = ProtoField.bytes("MSISDN", "MSISDN")

--s6a cdr
local f_s6a_procedure_type = ProtoField.uint8("s6a.ProcedureType", "ProcedureType", base.DEC, s6a_proc_type_Array)
local f_s6a_start_time = ProtoField.uint64("s6a.StartTime", "StartTime", base.DEC)
local f_s6a_end_time = ProtoField.uint64("s6a.EndTime", "EndTime", base.DEC)
local f_s6a_procedure_status = ProtoField.uint8("s6a.ProcedureStatus", "ProcedureStatus", base.DEC)
local f_s6a_cause = ProtoField.uint16("s6a.Cause", "Cause", base.DEC, s6a_result_code_Array)
local f_s6a_user_ipv4 = ProtoField.uint32("s6a.user_ipv4", "user_ipv4", base.DEC)
local f_s6a_user_ipv6 = ProtoField.bytes("s6a.user_ipv6", "user_ipv6", base.DEC)
local f_s6a_mme_ip = ProtoField.bytes("s6a.mme_ip", "mme_ip")
local f_s6a_hss_ip = ProtoField.bytes("s6a.hss_ip", "hss_ip")
local f_s6a_mme_port = ProtoField.uint16("s6a.mme_port", "mme_port", base.DEC)
local f_s6a_hss_port = ProtoField.uint16("s6a.hss_port", "hss_port", base.DEC)
local f_s6a_sub_status = ProtoField.uint8("s6a.subscriber_status", "subscriber_status", base.DEC, s6a_subscirber_status_Array)
local f_s6a_ar_data = ProtoField.uint8("s6a.access_restricion_data", "access_restricion_data", base.DEC, s6a_access_restriction_data_Array)

cdr_s6a.fields = { 
f_s6a_cdr_len, f_s6a_city, f_s6a_Interface, f_s6a_xdr_id_time, f_s6a_xdr_id_index, f_s6a_rat, f_s6a_imsi, f_s6a_imei, f_s6a_msisdn,
f_s6a_procedure_type, f_s6a_start_time, f_s6a_end_time, f_s6a_procedure_status, f_s6a_cause, f_s6a_mme_ip, f_s6a_hss_ip, f_s6a_mme_port, f_s6a_hss_port,
f_s6a_user_ipv4, f_s6a_user_ipv6, f_s6a_ip_type, f_s6a_ar_data, f_s6a_sub_status
}
 
function parseS6aCdr(buffer,pinfo,tree)
	local buffer_len = buffer:len()
    local offset = 0
--head
	tree:add(f_s6a_cdr_len, buffer(offset,2))
    offset = offset + 2
	tree:add(f_s6a_city, buffer(offset,2))
    offset = offset + 2
	tree:add(f_s6a_Interface, buffer(offset,1))
    offset = offset + 1
	tree:add(f_s6a_xdr_id_time, buffer(offset,8))
    offset = offset + 8
	tree:add(f_s6a_xdr_id_index, buffer(offset,8))
    offset = offset + 8
	tree:add(f_s6a_rat, buffer(offset,1))
    offset = offset + 1
	tree:add(f_s6a_imsi, buffer(offset,8))
    offset = offset + 8
	tree:add(f_s6a_imei, buffer(offset,8))
    offset = offset + 8
	tree:add(f_s6a_msisdn, buffer(offset,16))
    offset = offset + 16

    local proc_type = buffer(offset, 1):uint()
	pinfo.cols.protocol:append(string.format(" - %s", s6a_proc_type_Array[proc_type]))
    tree:add(f_s6a_procedure_type, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s6a_start_time, buffer(offset, 8)) 
    offset = offset + 8 
    tree:add(f_s6a_end_time, buffer(offset, 8)) 
    offset = offset + 8 
    tree:add(f_s6a_procedure_status, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s6a_cause, buffer(offset, 2)) 
    offset = offset + 2 
    tree:add(f_s6a_user_ipv4, buffer(offset, 4)) 
    offset = offset + 4 
    tree:add(f_s6a_user_ipv6, buffer(offset, 16)) 
    offset = offset + 16
    tree:add(f_s6a_mme_ip, buffer(offset, 16)) 
    offset = offset + 16
    tree:add(f_s6a_hss_ip, buffer(offset, 16)) 
    offset = offset + 16
    tree:add(f_s6a_mme_port, buffer(offset, 2)) 
    offset = offset + 2 
    tree:add(f_s6a_hss_port, buffer(offset, 2)) 
    offset = offset + 2 
    tree:add(f_s6a_sub_status, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s6a_ar_data, buffer(offset, 1)) 
    offset = offset + 1 
end



function cdr_s6a.dissector(buffer,pinfo,tree)
	pinfo.cols.protocol:set("S6a cdr")
	local buffer_len = buffer:len()
    
    local myTree = tree:add(cdr_s6a, buffer(0, buffer_len), string.format("S6a CDR"))
    parseS6aCdr(buffer(0, buffer_len),pinfo,myTree)
    return
end     
        
local temptable = DissectorTable.get("ldap.name")
temptable:add("cdr_s6a", cdr_s6a)

