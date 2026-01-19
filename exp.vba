=Code.CalculateDeduction(
    Fields!ATTENDANCE.Value,
    Round(Sum(Switch(Fields!REASON.Value = "UL", 1, Fields!REASON.Value = "SUL", 0.5, Fields!REASON.Value = "FUL", 0.5, True, 0), "STAFF_EMP_CODE")),
    Sum(IIF(Fields!REASON.Value = "ABS", 1, 0), "STAFF_EMP_CODE"),
    Sum(IIf(Fields!LATE.Value > 0, 1, 0), "STAFF_EMP_CODE"),
    Sum(IIF(Fields!REASON.Value = "ML", 1, 0), "STAFF_EMP_CODE"),
    Fields!ATTN_ABS.Value,
    Fields!ATTN_LATE.Value,
    Sum(Fields!LATE.Value, "STAFF_EMP_CODE"),
    Fields!UL_DED1.Value, Fields!UL_DED2.Value, Fields!UL_DED3.Value, Fields!UL_DED4.Value,
    Fields!ATTN_DED1.Value, Fields!ATTN_DED2.Value, Fields!ATTN_DED3.Value, Fields!ATTN_DED4.Value,
    Fields!LATE_DED1.Value, Fields!LATE_DED2.Value, Fields!LATE_DED3.Value, Fields!LATE_DED4.Value,
    Fields!ML_DED1.Value, Fields!ML_DED2.Value, Fields!ML_DED3.Value, Fields!ML_DED4.Value
)