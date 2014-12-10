local cdr_uu = Proto ("uu_cdr","uu cdr")



local uu_proc_type_Array =
{
[0x0001] = "RRC_CONNECT_SETUP", [0x0002] = "RRC_SECURITY_MODE_COMMAND", [0x0003] = "RRC_RE_CONFIGURATION", 
[0x0004] = "RRC_RE_ESTABLISMENT", [0x0005] = "RRC_RELEASE", [0x0006] = "RRC_HANDOVER_INTRA_CELL", 
[0x0007] = "RRC_HANDOVER_INTRA_ENB", [0x0008] = "RRC_HANDOVER_INTER_ENB", [0x0009] = "RRC_HANDOVER_IN", 
[0x000a] = "RRC_HANDOVER_OUT_OTHER_RAT", [0x000b] = "RRC_PAGEING_PS", [0x000c] = "RRC_PAGEING_CS", [0x000d] = "RRC_OTHER" 
}



--uu cdr
local f_uu_cdr_len = ProtoField.uint16("CDRLength", "CDRLength", base.DEC)
local f_uu_city = ProtoField.uint16("CITY", "CITY", base.DEC)
local f_uu_Interface = ProtoField.uint8("Interface", "Interface", base.DEC)
local f_uu_xdr_id_time = ProtoField.uint64("XDRIDTime", "XDRIDTime", base.DEC)
local f_uu_xdr_id_index = ProtoField.uint64("XDRIDIndex", "XDRIDIndex", base.DEC)
local f_uu_rat = ProtoField.uint8("RAT", "RAT", base.DEC)
local f_uu_imsi = ProtoField.bytes("IMSI", "IMSI")
local f_uu_imei = ProtoField.bytes("IMEI", "IMEI")
local f_uu_msisdn = ProtoField.bytes("MSISDN", "MSISDN")

local f_uu_procedure_type = ProtoField.uint8("ProcedureType", "ProcedureType", base.DEC, uu_proc_type_Array)
local f_uu_starttime = ProtoField.uint64("StartTime", "StartTime", base.DEC)
local f_uu_endtime = ProtoField.uint64("EndTime", "EndTime", base.DEC)
local f_uu_keyword = ProtoField.uint8("Keyword", "Keyword", base.DEC)
local f_uu_procedure_status = ProtoField.uint8("ProcedureStatus", "ProcedureStatus", base.DEC)
local f_uu_plmn_id = ProtoField.bytes("PLMN_ID", "PLMN_ID")
local f_uu_end_id = ProtoField.bytes("ENB_ID", "ENB_ID")
local f_uu_cell_id = ProtoField.uint32("CellID", "CellID", base.DEC)
local f_uu_c_rnti = ProtoField.uint16("C_RNTI", "C_RNTI", base.DEC)
local f_uu_target_enb_id = ProtoField.bytes("TARGET_ENB_ID", "TARGET_ENB_ID")
local f_uu_target_cell_id = ProtoField.uint32("TARGET_CELL_ID", "TARGET_CELL_ID", base.DEC)
local f_uu_target_c_rnti = ProtoField.uint16("TARGET_C_RNTI", "TARGET_C_RNTI", base.DEC)
local f_uu_mme_ue_s1ap_id = ProtoField.uint32("MME_UE_S1AP_ID", "MME_UE_S1AP_ID", base.DEC)
local f_uu_mme_group_id = ProtoField.uint16("MME_GROUP_ID", "MME_GROUP_ID", base.DEC)
local f_uu_mme_code = ProtoField.uint8("MME_CODE", "MME_CODE", base.DEC)
local f_uu_m_tmsi = ProtoField.uint32("M_TMSI", "M_TMSI", base.DEC)
local f_uu_csfb_indication = ProtoField.uint8("CSFB_INDICATION", "CSFB_INDICATION", base.DEC)
local f_uu_eps_bearer_num = ProtoField.uint8("EPS_BEARER_NUM", "EPS_BEARER_NUM", base.DEC)
local f_uu_bearer_id1 = ProtoField.uint8("BEARER_ID1", "BEARER_ID1", base.DEC)
local f_uu_bearer_status1 = ProtoField.uint8("BEARER_STATUS1", "BEARER_STATUS1", base.DEC)
local f_uu_bearer_id2 = ProtoField.uint8("BEARER_ID2", "BEARER_ID2", base.DEC)
local f_uu_bearer_status2 = ProtoField.uint8("BEARER_STATUS2", "BEARER_STATUS2", base.DEC)
local f_uu_bearer_id3 = ProtoField.uint8("BEARER_ID3", "BEARER_ID3", base.DEC)
local f_uu_bearer_status3 = ProtoField.uint8("BEARER_STATUS3", "BEARER_STATUS3", base.DEC)
local f_uu_bearer_id4 = ProtoField.uint8("BEARER_ID4", "BEARER_ID4", base.DEC)
local f_uu_bearer_status4 = ProtoField.uint8("BEARER_STATUS4", "BEARER_STATUS4", base.DEC)
local f_uu_bearer_id5 = ProtoField.uint8("BEARER_ID5", "BEARER_ID5", base.DEC)
local f_uu_bearer_status5 = ProtoField.uint8("BEARER_STATUS5", "BEARER_STATUS5", base.DEC)
local f_uu_bearer_id6 = ProtoField.uint8("BEARER_ID6", "BEARER_ID6", base.DEC)
local f_uu_bearer_status6 = ProtoField.uint8("BEARER_STATUS6", "BEARER_STATUS6", base.DEC)
local f_uu_bearer_id7 = ProtoField.uint8("BEARER_ID7", "BEARER_ID7", base.DEC)
local f_uu_bearer_status7 = ProtoField.uint8("BEARER_STATUS7", "BEARER_STATUS7", base.DEC)
local f_uu_bearer_id8 = ProtoField.uint8("BEARER_ID8", "BEARER_ID8", base.DEC)
local f_uu_bearer_status8 = ProtoField.uint8("BEARER_STATUS8", "BEARER_STATUS8", base.DEC)
local f_uu_bearer_id9 = ProtoField.uint8("BEARER_ID9", "BEARER_ID9", base.DEC)
local f_uu_bearer_status9 = ProtoField.uint8("BEARER_STATUS9", "BEARER_STATUS9", base.DEC)
local f_uu_bearer_id10 = ProtoField.uint8("BEARER_ID10", "BEARER_ID10", base.DEC)
local f_uu_bearer_status10 = ProtoField.uint8("BEARER_STATUS10", "BEARER_STATUS10", base.DEC)
local f_uu_bearer_id11 = ProtoField.uint8("BEARER_ID11", "BEARER_ID11", base.DEC)
local f_uu_bearer_status11 = ProtoField.uint8("BEARER_STATUS11", "BEARER_STATUS11", base.DEC)



cdr_uu.fields = { 
f_uu_cdr_len, f_uu_city, f_uu_Interface, f_uu_xdr_id_time, f_uu_xdr_id_index, f_uu_rat, f_uu_imsi, f_uu_imei, f_uu_msisdn,
f_uu_procedure_type, f_uu_starttime, f_uu_endtime, f_uu_keyword, f_uu_procedure_status, f_uu_plmn_id, f_uu_end_id, f_uu_cell_id, f_uu_c_rnti,
f_uu_target_enb_id, f_uu_target_cell_id, f_uu_target_c_rnti, f_uu_mme_ue_s1ap_id, f_uu_mme_group_id, f_uu_mme_code, f_uu_m_tmsi, f_uu_csfb_indication,
f_uu_eps_bearer_num, f_uu_bearer_id1, f_uu_bearer_status1, f_uu_bearer_id2, f_uu_bearer_status2, f_uu_bearer_id3, f_uu_bearer_status3, f_uu_bearer_id4,
f_uu_bearer_status4, f_uu_bearer_id5, f_uu_bearer_status5, f_uu_bearer_id6, f_uu_bearer_status6, f_uu_bearer_id7, f_uu_bearer_status7, f_uu_bearer_id8,
f_uu_bearer_status8, f_uu_bearer_id9, f_uu_bearer_status9, f_uu_bearer_id10, f_uu_bearer_status10, f_uu_bearer_id11, f_uu_bearer_status11, 
}


 function parseUUCdr(buffer,pinfo,tree)
	local buffer_len = buffer:len()
    local offset = 0
--head
	tree:add(f_uu_cdr_len, buffer(offset,2))
    offset = offset + 2
	tree:add(f_uu_city, buffer(offset,2))
    offset = offset + 2
	tree:add(f_uu_Interface, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_xdr_id_time, buffer(offset,8))
    offset = offset + 8
	tree:add(f_uu_xdr_id_index, buffer(offset,8))
    offset = offset + 8
	tree:add(f_uu_rat, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_imsi, buffer(offset,8))
    offset = offset + 8
	tree:add(f_uu_imei, buffer(offset,8))
    offset = offset + 8
	tree:add(f_uu_msisdn, buffer(offset,16))
    offset = offset + 16
--uu
    local proc_type = buffer(offset, 1):uint()
	pinfo.cols.protocol:append(string.format(" - %s", uu_proc_type_Array[proc_type]))
	tree:add(f_uu_procedure_type, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_starttime, buffer(offset,8))
    offset = offset + 8
	tree:add(f_uu_endtime, buffer(offset,8))
    offset = offset + 8
	tree:add(f_uu_keyword, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_procedure_status, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_plmn_id, buffer(offset,3))
    offset = offset + 3
	tree:add(f_uu_end_id, buffer(offset,3))
    offset = offset + 3
	tree:add(f_uu_cell_id, buffer(offset,4))
    offset = offset + 4
	tree:add(f_uu_c_rnti, buffer(offset,2))
    offset = offset + 2
	tree:add(f_uu_target_enb_id, buffer(offset,3))
    offset = offset + 3
	tree:add(f_uu_target_cell_id, buffer(offset,4))
    offset = offset + 4
	tree:add(f_uu_target_c_rnti, buffer(offset,2))
    offset = offset + 2
	tree:add(f_uu_mme_ue_s1ap_id, buffer(offset,4))
    offset = offset + 4
	tree:add(f_uu_mme_group_id, buffer(offset,2))
    offset = offset + 2
	tree:add(f_uu_mme_code, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_m_tmsi, buffer(offset,4))
    offset = offset + 4
	tree:add(f_uu_csfb_indication, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_eps_bearer_num, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id1, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status1, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id2, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status2, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id3, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status3, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id4, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status4, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id5, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status5, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id6, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status6, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id7, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status7, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id8, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status8, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id9, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status9, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id10, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status10, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_id11, buffer(offset,1))
    offset = offset + 1
	tree:add(f_uu_bearer_status11, buffer(offset,1))
    offset = offset + 1
end    
 


function cdr_uu.dissector(buffer,pinfo,tree)
	pinfo.cols.protocol:set("UU cdr")
	local buffer_len = buffer:len()
    
    local myTree = tree:add(cdr_uu, buffer(0, buffer_len), string.format("UU CDR"))
    parseUUCdr(buffer(0, buffer_len),pinfo,myTree)
    return
end     
        
local temptable = DissectorTable.get("ldap.name")
temptable:add("cdr_uu", cdr_uu)

