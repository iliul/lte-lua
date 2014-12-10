cdr_x2 = Proto ("x2_cdr","x2 cdr")




local x2_proc_type_Array =
{
[0x0001] = "X2_HANDOVER", [0x0002] = "X2_HANDOVER_CANCEL", [0x0003] = "X2_SETUP", 
[0x0004] = "X2_RESET", [0x0005] = "X2_ENB_CONFIGURATION_UPDATE", [0x0006] = "X2_RESOURCE_STATUS_REPORTING", 
[0x0007] = "X2_MOBILITY_SETTING_CHANGE", [0x0008] = "X2_CELL_ACTIVATION", [0x0009] = "X2_LOAD_INDIATION", 
[0x000a] = "X2_ERROR_INDICATION" 
}
 


--x2 cdr
local f_x2_cdr_len = ProtoField.uint16("CDRLength", "CDRLength", base.DEC)
local f_x2_city = ProtoField.uint16("CITY", "CITY", base.DEC)
local f_x2_Interface = ProtoField.uint8("Interface", "Interface", base.DEC)
local f_x2_xdr_id_time = ProtoField.uint64("XDRIDTime", "XDRIDTime", base.DEC)
local f_x2_xdr_id_index = ProtoField.uint64("XDRIDIndex", "XDRIDIndex", base.DEC)
local f_x2_rat = ProtoField.uint8("RAT", "RAT", base.DEC)
local f_x2_imsi = ProtoField.bytes("IMSI", "IMSI")
local f_x2_imei = ProtoField.bytes("IMEI", "IMEI")
local f_x2_msisdn = ProtoField.bytes("MSISDN", "MSISDN")

local f_x2_procedure_type = ProtoField.uint8("ProcedureType", "ProcedureType", base.DEC, x2_proc_type_Array)
local f_x2_starttime = ProtoField.uint64("StartTime", "StartTime", base.DEC)
local f_x2_endtime = ProtoField.uint64("EndTime", "EndTime", base.DEC)
local f_x2_procedure_status = ProtoField.uint8("ProcedureStatus", "ProcedureStatus", base.DEC)
local f_x2_source_cell_id = ProtoField.uint32("Source_cell_id", "Source_cell_id", base.DEC)
local f_x2_target_cell_id = ProtoField.uint32("Target_cell_id", "Target_cell_id", base.DEC)
local f_x2_source_enb_id_1 = ProtoField.uint8("source_enb_id_1", "source_enb_id_1", base.DEC)
local f_x2_source_enb_id_2 = ProtoField.uint8("source_enb_id_2", "source_enb_id_2", base.DEC)
local f_x2_source_enb_id_3 = ProtoField.uint8("source_enb_id_3", "source_enb_id_3", base.DEC)
local f_x2_target_enb_id_1 = ProtoField.uint8("target_enb_id_1", "target_enb_id_1", base.DEC)
local f_x2_target_enb_id_2 = ProtoField.uint8("target_enb_id_2", "target_enb_id_2", base.DEC)
local f_x2_target_enb_id_3 = ProtoField.uint8("target_enb_id_3", "target_enb_id_3", base.DEC)
local f_x2_mme_ue_s1ap_id = ProtoField.uint32("MME_UE_S1AP_ID", "MME_UE_S1AP_ID", base.DEC)
local f_x2_mme_group_id = ProtoField.uint16("MME_GROUP_ID", "MME_GROUP_ID", base.DEC)
local f_x2_mme_code = ProtoField.uint8("MME_CODE", "MME_CODE", base.DEC)
local f_x2_req_cause = ProtoField.uint16("Req_cause", "Req_cause", base.DEC)
local f_x2_filure_cause = ProtoField.uint16("Filure_cause", "Filure_cause", base.DEC)
local f_x2_eps_bearer_num = ProtoField.uint8("EPS_BEARER_NUM", "EPS_BEARER_NUM", base.DEC)
local f_x2_bearer_id1 = ProtoField.uint8("BEARER_ID1", "BEARER_ID1", base.DEC)
local f_x2_bearer_status1 = ProtoField.uint8("BEARER_STATUS1", "BEARER_STATUS1", base.DEC)
local f_x2_bearer_id2 = ProtoField.uint8("BEARER_ID2", "BEARER_ID2", base.DEC)
local f_x2_bearer_status2 = ProtoField.uint8("BEARER_STATUS2", "BEARER_STATUS2", base.DEC)
local f_x2_bearer_id3 = ProtoField.uint8("BEARER_ID3", "BEARER_ID3", base.DEC)
local f_x2_bearer_status3 = ProtoField.uint8("BEARER_STATUS3", "BEARER_STATUS3", base.DEC)
local f_x2_bearer_id4 = ProtoField.uint8("BEARER_ID4", "BEARER_ID4", base.DEC)
local f_x2_bearer_status4 = ProtoField.uint8("BEARER_STATUS4", "BEARER_STATUS4", base.DEC)
local f_x2_bearer_id5 = ProtoField.uint8("BEARER_ID5", "BEARER_ID5", base.DEC)
local f_x2_bearer_status5 = ProtoField.uint8("BEARER_STATUS5", "BEARER_STATUS5", base.DEC)
local f_x2_bearer_id6 = ProtoField.uint8("BEARER_ID6", "BEARER_ID6", base.DEC)
local f_x2_bearer_status6 = ProtoField.uint8("BEARER_STATUS6", "BEARER_STATUS6", base.DEC)
local f_x2_bearer_id7 = ProtoField.uint8("BEARER_ID7", "BEARER_ID7", base.DEC)
local f_x2_bearer_status7 = ProtoField.uint8("BEARER_STATUS7", "BEARER_STATUS7", base.DEC)
local f_x2_bearer_id8 = ProtoField.uint8("BEARER_ID8", "BEARER_ID8", base.DEC)
local f_x2_bearer_status8 = ProtoField.uint8("BEARER_STATUS8", "BEARER_STATUS8", base.DEC)
local f_x2_bearer_id9 = ProtoField.uint8("BEARER_ID9", "BEARER_ID9", base.DEC)
local f_x2_bearer_status9 = ProtoField.uint8("BEARER_STATUS9", "BEARER_STATUS9", base.DEC)
local f_x2_bearer_id10 = ProtoField.uint8("BEARER_ID10", "BEARER_ID10", base.DEC)
local f_x2_bearer_status10 = ProtoField.uint8("BEARER_STATUS10", "BEARER_STATUS10", base.DEC)
local f_x2_bearer_id11 = ProtoField.uint8("BEARER_ID11", "BEARER_ID11", base.DEC)
local f_x2_bearer_status11 = ProtoField.uint8("BEARER_STATUS11", "BEARER_STATUS11", base.DEC)


cdr_x2.fields = { 
--x2 
f_x2_cdr_len, f_x2_city, f_x2_Interface, f_x2_xdr_id_time, f_x2_xdr_id_index, f_x2_rat, f_x2_imsi, f_x2_imei, f_x2_msisdn,
f_x2_procedure_type, f_x2_starttime, f_x2_endtime, f_x2_procedure_status, f_x2_source_cell_id, f_x2_target_cell_id, f_x2_source_enb_id_1, f_x2_source_enb_id_2,
f_x2_source_enb_id_3, f_x2_target_enb_id_1, f_x2_target_enb_id_2, f_x2_target_enb_id_3, f_x2_mme_ue_s1ap_id, f_x2_mme_group_id, f_x2_mme_code, f_x2_req_cause, f_x2_filure_cause,  
f_x2_eps_bearer_num, f_x2_bearer_id1, f_x2_bearer_status1, f_x2_bearer_id2, f_x2_bearer_status2, f_x2_bearer_id3, f_x2_bearer_status3, f_x2_bearer_id4,
f_x2_bearer_status4, f_x2_bearer_id5, f_x2_bearer_status5, f_x2_bearer_id6, f_x2_bearer_status6, f_x2_bearer_id7, f_x2_bearer_status7, f_x2_bearer_id8,
f_x2_bearer_status8, f_x2_bearer_id9, f_x2_bearer_status9, f_x2_bearer_id10, f_x2_bearer_status10, f_x2_bearer_id11, f_x2_bearer_status11,
}

-- parse x2
function parseX2Cdr(buffer,pinfo,tree)
	local buffer_len = buffer:len()
    local offset = 0
--head
	tree:add(f_x2_cdr_len, buffer(offset,2))
    offset = offset + 2
	tree:add(f_x2_city, buffer(offset,2))
    offset = offset + 2
	tree:add(f_x2_Interface, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_xdr_id_time, buffer(offset,8))
    offset = offset + 8
	tree:add(f_x2_xdr_id_index, buffer(offset,8))
    offset = offset + 8
	tree:add(f_x2_rat, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_imsi, buffer(offset,8))
    offset = offset + 8
	tree:add(f_x2_imei, buffer(offset,8))
    offset = offset + 8
	tree:add(f_x2_msisdn, buffer(offset,16))
    offset = offset + 16
--x2 
    local proc_type = buffer(offset, 1):uint()
	pinfo.cols.protocol:append(string.format(" - %s", x2_proc_type_Array[proc_type]))
	tree:add(f_x2_procedure_type, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_starttime, buffer(offset,8))
    offset = offset + 8
	tree:add(f_x2_endtime, buffer(offset,8))
    offset = offset + 8
	tree:add(f_x2_procedure_status, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_source_cell_id, buffer(offset,4))
    offset = offset + 4
	tree:add(f_x2_target_cell_id, buffer(offset,4))
    offset = offset + 4
    tree:add(f_x2_source_enb_id_1, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_source_enb_id_2, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_source_enb_id_3, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_target_enb_id_1, buffer(offset,1))
    offset = offset + 1
    tree:add(f_x2_target_enb_id_2, buffer(offset,1))
    offset = offset + 1
    tree:add(f_x2_target_enb_id_3, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_mme_ue_s1ap_id, buffer(offset,4))
    offset = offset + 4
	tree:add(f_x2_mme_group_id, buffer(offset,2))
    offset = offset + 2
	tree:add(f_x2_mme_code, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_req_cause, buffer(offset,2))
    offset = offset + 2
	tree:add(f_x2_filure_cause, buffer(offset,2))
    offset = offset + 2
	tree:add(f_x2_eps_bearer_num, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id1, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status1, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id2, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status2, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id3, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status3, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id4, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status4, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id5, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status5, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id6, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status6, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id7, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status7, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id8, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status8, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id9, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status9, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id10, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status10, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_id11, buffer(offset,1))
    offset = offset + 1
	tree:add(f_x2_bearer_status11, buffer(offset,1))
    offset = offset + 1
end   

function cdr_x2.dissector(buffer,pinfo,tree)
	pinfo.cols.protocol:set("X2 cdr")
	local buffer_len = buffer:len()
    
    local myTree = tree:add(cdr_x2, buffer(0, buffer_len), string.format("X2 CDR"))
    parseX2Cdr(buffer(0, buffer_len),pinfo,myTree)
    return
end     
        
local temptable = DissectorTable.get("ldap.name")
temptable:add("cdr_x2", cdr_x2)


