cdr_s1_mme = Proto ("s1mme","s1mme_cdr")


local s1_proc_type_Array = 
{
[0x0001] = "Attach", [0x0002] = "Service Request", [0x0003] = "Extended Service Requet", [0x0004] = "Paging",
[0x0005] = "TAU", [0x0006] = "Detach", [0x0007] = "PDN connectivity", [0x0008] = "PDN disconnection",
[0x0009] = "EPS bearer resource allocation", [0x000a] = "EPS bearer resource modify", [0x000b] = "EPS bearer context deactivation",
[0x000c] = "EPS bearer context modification", [0x000d] = "Dedicated EPS bearer context activation",
[0x000e] = "PATH SWITCH", [0x000f] = "HADNOVER REQUIRED", [0x0010] = "HANDOVER REQUEST", [0x0011] = "INITIAL Context setup",
[0x0012] = "UE context modification", [0x0013] = "UE context release", [0x0014] = "E-RAB release", [0x0015] = "RESET",
[0x0016] = "Error indication", [0x0017] = "S1 setup", [0x0018] = "ENB Configuration Update", [0x0019] = "MME Configuration Update",
[0x001a] = "OVERLOAD", [0x001b] = "OVERSTOP", [0x001c] = "Identity Acquisition", [0x001d] = "Authentication", [0x001e] = "Security Activation"
}

--zc header
local f_total_len = ProtoField.uint16("TotalLength", "TotalLength", base.DEC)
local f_msg_type = ProtoField.uint16("MsgType", "MsgType", base.DEC, msg_type_Array)
local f_seq_id = ProtoField.uint16("SequenceId", "SequenceId", base.DEC)
local f_fragment = ProtoField.uint32("Fragement", "Fragement", base.DEC)

--head
local f_s1_cdr_len = ProtoField.uint16("CDRLength", "CDRLength", base.DEC)
local f_s1_city = ProtoField.uint16("CITY", "CITY", base.DEC)
local f_s1_Interface = ProtoField.uint8("Interface", "Interface", base.DEC)
local f_s1_xdr_id_time = ProtoField.uint64("XDRIDTime", "XDRIDTime", base.DEC)
local f_s1_xdr_id_index = ProtoField.uint64("XDRIDIndex", "XDRIDIndex", base.DEC)
local f_s1_rat = ProtoField.uint8("RAT", "RAT", base.DEC)
local f_s1_imsi = ProtoField.bytes("IMSI", "IMSI")
local f_s1_imei = ProtoField.bytes("IMEI", "IMEI")
local f_s1_msisdn = ProtoField.bytes("MSISDN", "MSISDN")

--s1_mme cdr
local f_s1_procedure_type = ProtoField.uint8("s1mme.ProcedureType", "ProcedureType", base.DEC, s1_proc_type_Array)
local f_s1_start_time = ProtoField.uint64("s1mme.StartTime", "StartTime", base.DEC)
local f_s1_end_time = ProtoField.uint64("s1mme.EndTime", "EndTime", base.DEC)
local f_s1_procedure_status = ProtoField.uint8("s1mme.ProcedureStatus", "ProcedureStatus", base.DEC)
local f_s1_cause = ProtoField.uint16("s1mme.Cause", "Cause", base.DEC)
local f_s1_keyword = ProtoField.uint8("s1mme.Keyword", "Keyword", base.DEC)
local f_s1_mme_s1ap_id = ProtoField.uint32("s1mme.MME_UE_S1AP_ID", "MME_UE_S1AP_ID", base.DEC)
local f_s1_mme_group_id = ProtoField.uint16("s1mme.MME_GROUP_ID", "MME_GROUP_ID", base.DEC)
local f_s1_mme_code = ProtoField.uint8("s1mme.MME_CODE", "MME_CODE", base.DEC)
local f_s1_m_tmsi = ProtoField.uint32("s1mme.M_TMSI", "M_TMSI", base.DEC)
local f_s1_tmsi = ProtoField.uint32("s1mme.TMSI", "TMSI", base.DEC)
local f_s1_user_ipv4 = ProtoField.uint32("s1mme.user_ipv4", "user_ipv4", base.DEC)
local f_s1_user_ipv6 = ProtoField.bytes("s1mme.user_ipv6", "user_ipv6", base.DEC)
local f_s1_mme_ip = ProtoField.bytes("s1mme.mme_ip", "mme_ip")
local f_s1_enb_ip = ProtoField.bytes("s1mme.enb_ip", "enb_ip")
local f_s1_mme_port = ProtoField.uint16("s1mme.mme_port", "mme_port", base.DEC)
local f_s1_enb_port = ProtoField.uint16("s1mme.enb_port", "enb_port", base.DEC)
local f_s1_tac = ProtoField.uint16("s1mme.tac", "tac", base.DEC)
local f_s1_cell_id = ProtoField.uint32("s1mme.cell_id", "cell_id", base.DEC)
local f_s1_other_tac = ProtoField.uint16("s1mme.other_tac", "other_tac", base.DEC)
local f_s1_other_eci = ProtoField.uint32("s1mme.other_eci", "other_eci", base.DEC)
local f_s1_apn = ProtoField.bytes("s1mme.APN", "APN")
local f_s1_eps_nub = ProtoField.uint8("s1mme.EPS_BEARER_NUM", "EPS_BEARER_NUM", base.DEC)
local f_s1_ip_type = ProtoField.uint8("s1mme.Device_ip_type", "ip_type", base.DEC)

local f_s1_bearer_id1 = ProtoField.uint8("s1mme.BEARER_ID1", "BEARER_ID1", base.DEC)
local f_s1_bearer_type1 = ProtoField.uint8("s1mme.BEARER_TYPE1", "BEARER_TYPE1", base.DEC)
local f_s1_bearer_qci1 = ProtoField.uint8("s1mme.BEARER_QCI1", "BEARER_QCI1", base.DEC)
local f_s1_bearer_status1 = ProtoField.uint8("s1mme.BEARER_STATUS1", "BEARER_STATUS1", base.DEC)
local f_s1_bearer_enb_teid1 = ProtoField.uint32("s1mme.BEARER_ENB_TEID2", "BEARER_ENB_TEID1", base.DEC)
local f_s1_bearer_sgw_teid1 = ProtoField.uint32("s1mme.BEARER_SGW_TEID2", "BEARER_SGW_TEID1", base.DEC)

local f_s1_bearer_id2 = ProtoField.uint8("s1mme.BEARER_ID2", "BEARER_ID2", base.DEC)
local f_s1_bearer_type2 = ProtoField.uint8("s1mme.BEARER_TYPE2", "BEARER_TYPE2", base.DEC)
local f_s1_bearer_qci2 = ProtoField.uint8("s1mme.BEARER_QCI2", "BEARER_QCI2", base.DEC)
local f_s1_bearer_status2 = ProtoField.uint8("s1mme.BEARER_STATUS2", "BEARER_STATUS2", base.DEC)
local f_s1_bearer_enb_teid2 = ProtoField.uint32("s1mme.BEARER_ENB_TEID2", "BEARER_ENB_TEID2", base.DEC)
local f_s1_bearer_sgw_teid2 = ProtoField.uint32("s1mme.BEARER_SGW_TEID2", "BEARER_SGW_TEID2", base.DEC)

local f_s1_bearer_id3 = ProtoField.uint8("s1mme.BEARER_ID3", "BEARER_ID3", base.DEC)
local f_s1_bearer_type3 = ProtoField.uint8("s1mme.BEARER_TYPE3", "BEARER_TYPE3", base.DEC)
local f_s1_bearer_qci3 = ProtoField.uint8("s1mme.BEARER_QCI3", "BEARER_QCI3", base.DEC)
local f_s1_bearer_status3 = ProtoField.uint8("s1mme.BEARER_STATUS3", "BEARER_STATUS3", base.DEC)
local f_s1_bearer_enb_teid3 = ProtoField.uint32("s1mme.BEARER_ENB_TEID4", "BEARER_ENB_TEID3", base.DEC)
local f_s1_bearer_sgw_teid3 = ProtoField.uint32("s1mme.BEARER_SGW_TEID4", "BEARER_SGW_TEID3", base.DEC)

local f_s1_bearer_id4 = ProtoField.uint8("s1mme.BEARER_ID4", "BEARER_ID4", base.DEC)
local f_s1_bearer_type4 = ProtoField.uint8("s1mme.BEARER_TYPE4", "BEARER_TYPE4", base.DEC)
local f_s1_bearer_qci4 = ProtoField.uint8("s1mme.BEARER_QCI4", "BEARER_QCI4", base.DEC)
local f_s1_bearer_status4 = ProtoField.uint8("s1mme.BEARER_STATUS4", "BEARER_STATUS4", base.DEC)
local f_s1_bearer_enb_teid4 = ProtoField.uint32("s1mme.BEARER_ENB_TEID4", "BEARER_ENB_TEID4", base.DEC)
local f_s1_bearer_sgw_teid4 = ProtoField.uint32("s1mme.BEARER_SGW_TEID4", "BEARER_SGW_TEID4", base.DEC)

local f_s1_bearer_id5 = ProtoField.uint8("s1mme.BEARER_ID5", "BEARER_ID5", base.DEC)
local f_s1_bearer_type5 = ProtoField.uint8("s1mme.BEARER_TYPE5", "BEARER_TYPE5", base.DEC)
local f_s1_bearer_qci5 = ProtoField.uint8("s1mme.BEARER_QCI5", "BEARER_QCI5", base.DEC)
local f_s1_bearer_status5 = ProtoField.uint8("s1mme.BEARER_STATUS5", "BEARER_STATUS5", base.DEC)
local f_s1_bearer_enb_teid5 = ProtoField.uint32("s1mme.BEARER_ENB_TEID5", "BEARER_ENB_TEID5", base.DEC)
local f_s1_bearer_sgw_teid5 = ProtoField.uint32("s1mme.BEARER_SGW_TEID5", "BEARER_SGW_TEID5", base.DEC)

local f_s1_bearer_id6 = ProtoField.uint8("s1mme.BEARER_ID6", "BEARER_ID6", base.DEC)
local f_s1_bearer_type6 = ProtoField.uint8("s1mme.BEARER_TYPE6", "BEARER_TYPE6", base.DEC)
local f_s1_bearer_qci6 = ProtoField.uint8("s1mme.BEARER_QCI6", "BEARER_QCI6", base.DEC)
local f_s1_bearer_status6 = ProtoField.uint8("s1mme.BEARER_STATUS6", "BEARER_STATUS6", base.DEC)
local f_s1_bearer_enb_teid6 = ProtoField.uint32("s1mme.BEARER_ENB_TEID6", "BEARER_ENB_TEID6", base.DEC)
local f_s1_bearer_sgw_teid6 = ProtoField.uint32("s1mme.BEARER_SGW_TEID6", "BEARER_SGW_TEID6", base.DEC)

local f_s1_bearer_id7 = ProtoField.uint8("s1mme.BEARER_ID7", "BEARER_ID7", base.DEC)
local f_s1_bearer_type7 = ProtoField.uint8("s1mme.BEARER_TYPE7", "BEARER_TYPE7", base.DEC)
local f_s1_bearer_qci7 = ProtoField.uint8("s1mme.BEARER_QCI7", "BEARER_QCI7", base.DEC)
local f_s1_bearer_status7 = ProtoField.uint8("s1mme.BEARER_STATUS7", "BEARER_STATUS7", base.DEC)
local f_s1_bearer_enb_teid7 = ProtoField.uint32("s1mme.BEARER_ENB_TEID7", "BEARER_ENB_TEID7", base.DEC)
local f_s1_bearer_sgw_teid7 = ProtoField.uint32("s1mme.BEARER_SGW_TEID7", "BEARER_SGW_TEID7", base.DEC)

local f_s1_bearer_id8 = ProtoField.uint8("s1mme.BEARER_ID8", "BEARER_ID8", base.DEC)
local f_s1_bearer_type8 = ProtoField.uint8("s1mme.BEARER_TYPE8", "BEARER_TYPE8", base.DEC)
local f_s1_bearer_qci8 = ProtoField.uint8("s1mme.BEARER_QCI8", "BEARER_QCI8", base.DEC)
local f_s1_bearer_status8 = ProtoField.uint8("s1mme.BEARER_STATUS8", "BEARER_STATUS8", base.DEC)
local f_s1_bearer_enb_teid8 = ProtoField.uint32("s1mme.BEARER_ENB_TEID8", "BEARER_ENB_TEID8", base.DEC)
local f_s1_bearer_sgw_teid8 = ProtoField.uint32("s1mme.BEARER_SGW_TEID8", "BEARER_SGW_TEID8", base.DEC)

local f_s1_bearer_id9 = ProtoField.uint8("s1mme.BEARER_ID9", "BEARER_ID9", base.DEC)
local f_s1_bearer_type9 = ProtoField.uint8("s1mme.BEARER_TYPE9", "BEARER_TYPE9", base.DEC)
local f_s1_bearer_qci9 = ProtoField.uint8("s1mme.BEARER_QCI9", "BEARER_QCI9", base.DEC)
local f_s1_bearer_status9 = ProtoField.uint8("s1mme.BEARER_STATUS9", "BEARER_STATUS9", base.DEC)
local f_s1_bearer_enb_teid9 = ProtoField.uint32("s1mme.BEARER_ENB_TEID9", "BEARER_ENB_TEID9", base.DEC)
local f_s1_bearer_sgw_teid9 = ProtoField.uint32("s1mme.BEARER_SGW_TEID9", "BEARER_SGW_TEID9", base.DEC)

local f_s1_bearer_id10 = ProtoField.uint8("s1mme.BEARER_ID10", "BEARER_ID10", base.DEC)
local f_s1_bearer_type10 = ProtoField.uint8("s1mme.BEARER_TYPE10", "BEARER_TYPE10", base.DEC)
local f_s1_bearer_qci10 = ProtoField.uint8("s1mme.BEARER_QCI10", "BEARER_QCI10", base.DEC)
local f_s1_bearer_status10 = ProtoField.uint8("s1mme.BEARER_STATUS10", "BEARER_STATUS10", base.DEC)
local f_s1_bearer_enb_teid10 = ProtoField.uint32("s1mme.BEARER_ENB_TEID10", "BEARER_ENB_TEID10", base.DEC)
local f_s1_bearer_sgw_teid10 = ProtoField.uint32("s1mme.BEARER_SGW_TEID10", "BEARER_SGW_TEID10", base.DEC)

local f_s1_bearer_id11 = ProtoField.uint8("s1mme.BEARER_ID11", "BEARER_ID11", base.DEC)
local f_s1_bearer_type11 = ProtoField.uint8("s1mme.BEARER_TYPE11", "BEARER_TYPE11", base.DEC)
local f_s1_bearer_qci11 = ProtoField.uint8("s1mme.BEARER_QCI11", "BEARER_QCI11", base.DEC)
local f_s1_bearer_status11 = ProtoField.uint8("s1mme.BEARER_STATUS11", "BEARER_STATUS11", base.DEC)
local f_s1_bearer_enb_teid11 = ProtoField.uint32("s1mme.BEARER_ENB_TEID11", "BEARER_ENB_TEID11", base.DEC)
local f_s1_bearer_sgw_teid11 = ProtoField.uint32("s1mme.BEARER_SGW_TEID11", "BEARER_SGW_TEID11", base.DEC)


cdr_s1_mme.fields = { 
f_total_len, f_msg_type, f_seq_id, f_fragment,
--s1 MME
f_s1_cdr_len, f_s1_city, f_s1_Interface, f_s1_xdr_id_time, f_s1_xdr_id_index, f_s1_rat, f_s1_imsi, f_s1_imei, f_s1_msisdn,
f_s1_procedure_type, f_s1_start_time, f_s1_end_time, f_s1_procedure_status, f_s1_cause, f_s1_keyword, f_s1_mme_s1ap_id, f_s1_mme_group_id,
f_s1_mme_code, f_s1_mme_ip, f_s1_enb_ip, f_s1_mme_port, f_s1_enb_port, f_s1_m_tmsi, f_s1_tmsi, f_s1_tac, f_s1_cell_id, f_s1_other_tac,
f_s1_other_eci, f_s1_apn, f_s1_eps_nub, f_s1_user_ipv4, f_s1_user_ipv6, f_s1_ip_type,
f_s1_bearer_id1, f_s1_bearer_type1, f_s1_bearer_qci1, f_s1_bearer_status1, f_s1_bearer_enb_teid1, f_s1_bearer_sgw_teid1, 
f_s1_bearer_id2, f_s1_bearer_type2, f_s1_bearer_qci2, f_s1_bearer_status2, f_s1_bearer_enb_teid2, f_s1_bearer_sgw_teid2, 
f_s1_bearer_id3, f_s1_bearer_type3, f_s1_bearer_qci3, f_s1_bearer_status3, f_s1_bearer_enb_teid3, f_s1_bearer_sgw_teid3, 
f_s1_bearer_id4, f_s1_bearer_type4, f_s1_bearer_qci4, f_s1_bearer_status4, f_s1_bearer_enb_teid4, f_s1_bearer_sgw_teid4, 
f_s1_bearer_id5, f_s1_bearer_type5, f_s1_bearer_qci5, f_s1_bearer_status5, f_s1_bearer_enb_teid5, f_s1_bearer_sgw_teid5, 
f_s1_bearer_id6, f_s1_bearer_type6, f_s1_bearer_qci6, f_s1_bearer_status6, f_s1_bearer_enb_teid6, f_s1_bearer_sgw_teid6, 
f_s1_bearer_id7, f_s1_bearer_type7, f_s1_bearer_qci7, f_s1_bearer_status7, f_s1_bearer_enb_teid7, f_s1_bearer_sgw_teid7, 
f_s1_bearer_id8, f_s1_bearer_type8, f_s1_bearer_qci8, f_s1_bearer_status8, f_s1_bearer_enb_teid8, f_s1_bearer_sgw_teid8, 
f_s1_bearer_id9, f_s1_bearer_type9, f_s1_bearer_qci9, f_s1_bearer_status9, f_s1_bearer_enb_teid9, f_s1_bearer_sgw_teid9, 
f_s1_bearer_id10, f_s1_bearer_type10, f_s1_bearer_qci10, f_s1_bearer_status10, f_s1_bearer_enb_teid10, f_s1_bearer_sgw_teid10, 
f_s1_bearer_id11, f_s1_bearer_type11, f_s1_bearer_qci11, f_s1_bearer_status11, f_s1_bearer_enb_teid11, f_s1_bearer_sgw_teid11 
}

function parseS1MMECdr2(buffer,pinfo,tree)
	local buffer_len = buffer:len()
    local offset = 0

    tree:add(f_s1_bearer_id5, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type5, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci5, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status5, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid5, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid5, buffer(offset, 4)) 
    offset = offset + 4

    tree:add(f_s1_bearer_id6, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type6, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci6, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status6, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid6, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid6, buffer(offset, 4)) 
    offset = offset + 4

    tree:add(f_s1_bearer_id7, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type7, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci7, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status7, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid7, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid7, buffer(offset, 4)) 
    offset = offset + 4

    tree:add(f_s1_bearer_id8, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type8, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci8, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status8, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid8, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid8, buffer(offset, 4)) 
    offset = offset + 4

    tree:add(f_s1_bearer_id9, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type9, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci9, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status9, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid9, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid9, buffer(offset, 4)) 
    offset = offset + 4

    tree:add(f_s1_bearer_id10, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type10, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci10, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status10, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid10, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid10, buffer(offset, 4)) 
    offset = offset + 4

    tree:add(f_s1_bearer_id11, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type11, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci11, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status11, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid11, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid11, buffer(offset, 4)) 
end

 
function parseS1MMECdr(buffer,pinfo,tree)
	local buffer_len = buffer:len()
    local offset = 0
--head
	tree:add(f_s1_cdr_len, buffer(offset,2))
    offset = offset + 2
	tree:add(f_s1_city, buffer(offset,2))
    offset = offset + 2
	tree:add(f_s1_Interface, buffer(offset,1))
    offset = offset + 1
	tree:add(f_s1_xdr_id_time, buffer(offset,8))
    offset = offset + 8
	tree:add(f_s1_xdr_id_index, buffer(offset,8))
    offset = offset + 8
	tree:add(f_s1_rat, buffer(offset,1))
    offset = offset + 1
	tree:add(f_s1_imsi, buffer(offset,8))
    offset = offset + 8
	tree:add(f_s1_imei, buffer(offset,8))
    offset = offset + 8
	tree:add(f_s1_msisdn, buffer(offset,16))
    offset = offset + 16
--s1 MME
    local proc_type = buffer(offset, 1):uint()
	pinfo.cols.protocol:append(string.format(" - %s", s1_proc_type_Array[proc_type]))
    tree:add(f_s1_procedure_type, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_start_time, buffer(offset, 8)) 
    offset = offset + 8 
    tree:add(f_s1_end_time, buffer(offset, 8)) 
    offset = offset + 8 
    tree:add(f_s1_procedure_status, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_cause, buffer(offset, 2)) 
    offset = offset + 2 
    tree:add(f_s1_keyword, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_mme_s1ap_id, buffer(offset, 4)) 
    offset = offset + 4 
    tree:add(f_s1_mme_group_id, buffer(offset, 2)) 
    offset = offset + 2 
    tree:add(f_s1_mme_code, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_m_tmsi, buffer(offset, 4)) 
    offset = offset + 4 
    tree:add(f_s1_tmsi, buffer(offset, 4)) 
    offset = offset + 4 
    tree:add(f_s1_user_ipv4, buffer(offset, 4)) 
    offset = offset + 4 
    tree:add(f_s1_user_ipv6, buffer(offset, 16)) 
    offset = offset + 16
    tree:add(f_s1_mme_ip, buffer(offset, 16)) 
    offset = offset + 16
    tree:add(f_s1_enb_ip, buffer(offset, 16)) 
    offset = offset + 16
    tree:add(f_s1_mme_port, buffer(offset, 2)) 
    offset = offset + 2 
    tree:add(f_s1_enb_port, buffer(offset, 2)) 
    offset = offset + 2 
    tree:add(f_s1_tac, buffer(offset, 2)) 
    offset = offset + 2
    tree:add(f_s1_cell_id, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_other_tac, buffer(offset, 2)) 
    offset = offset + 2
    tree:add(f_s1_other_eci, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_apn, buffer(offset, 32)) 
    offset = offset + 32
    tree:add(f_s1_eps_nub, buffer(offset, 1)) 
    offset = offset + 1

    tree:add(f_s1_bearer_id1, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type1, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci1, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status1, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid1, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid1, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_id2, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type2, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci2, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status2, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid2, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid2, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_id3, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type3, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci3, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status3, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid3, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid3, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_id4, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_type4, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_qci4, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_status4, buffer(offset, 1)) 
    offset = offset + 1
    tree:add(f_s1_bearer_enb_teid4, buffer(offset, 4)) 
    offset = offset + 4
    tree:add(f_s1_bearer_sgw_teid4, buffer(offset, 4)) 
    offset = offset + 4
    parseS1MMECdr2(buffer(offset, (buffer_len-offset)),pinfo,tree)
end


function cdr_s1_mme.dissector(buffer,pinfo,tree)
	pinfo.cols.protocol:set("S1-MME cdr")
	local buffer_len = buffer:len()
    
    local myTree = tree:add(cdr_s1_mme, buffer(0, buffer_len), string.format("S1-MME CDR"))
    parseS1MMECdr(buffer(0, buffer_len),pinfo,myTree)
    return
end     
        
local temptable = DissectorTable.get("ldap.name")
temptable:add("cdr_s1_mme", cdr_s1_mme)

