' ==========================================================================================
' INSTRUCTIONS:
' 1. Copy the function below into your Report Properties > Code.
' 2. Use the expression at the bottom in your textbox.
' ==========================================================================================

Public Function CalculateDeduction( _
    ByVal AttendanceValue As Double, _
    ByVal AttnAbs As Double, _
    ByVal AttnLate As Double, _
    ByVal TotalLateValue As Double, _
    ByVal ULDays As Double, _
    ByVal ABSDays As Double, _
    ByVal LateDays As Double, _
    ByVal MLDays As Double, _
    ByVal ULDed1 As Double, ByVal ULDed2 As Double, ByVal ULDed3 As Double, ByVal ULDed4 As Double, _
    ByVal ATTNDed1 As Double, ByVal ATTNDed2 As Double, ByVal ATTNDed3 As Double, ByVal ATTNDed4 As Double, _
    ByVal LateDed1 As Double, ByVal LateDed2 As Double, ByVal LateDed3 As Double, ByVal LateDed4 As Double, _
    ByVal MLDed1 As Double, ByVal MLDed2 As Double, ByVal MLDed3 As Double, ByVal MLDed4 As Double _
) As Double

    Dim totalDeduction As Double
    totalDeduction = 0
    
    ' Check for ABS condition
    If AttnAbs = 1 Then
        If TotalLateValue >= AttnLate Then
            CalculateDeduction = 0
            Exit Function
        End If
    End If
    
    
    ' Calculate UL Deduction (Sum of UL_DED fields up to UL_Days, max 4)
    If ULDays >= 1 Then totalDeduction = totalDeduction + ULDed1
    If ULDays >= 2 Then totalDeduction = totalDeduction + ULDed2
    If ULDays >= 3 Then totalDeduction = totalDeduction + ULDed3
    If ULDays >= 4 Then totalDeduction = totalDeduction + ULDed4
    
    ' Calculate ABS Deduction (using ATTN_DED fields)
    If ABSDays >= 1 Then totalDeduction = totalDeduction + ATTNDed1
    If ABSDays >= 2 Then totalDeduction = totalDeduction + ATTNDed2
    If ABSDays >= 3 Then totalDeduction = totalDeduction + ATTNDed3
    If ABSDays >= 4 Then totalDeduction = totalDeduction + ATTNDed4
    
    ' Calculate Late Deduction
    If LateDays >= 1 Then totalDeduction = totalDeduction + LateDed1
    If LateDays >= 2 Then totalDeduction = totalDeduction + LateDed2
    If LateDays >= 3 Then totalDeduction = totalDeduction + LateDed3
    If LateDays >= 4 Then totalDeduction = totalDeduction + LateDed4

    ' Calculate ML Deduction
    If MLDays >= 1 Then totalDeduction = totalDeduction + MLDed1
    If MLDays >= 2 Then totalDeduction = totalDeduction + MLDed2
    If MLDays >= 3 Then totalDeduction = totalDeduction + MLDed3
    If MLDays >= 4 Then totalDeduction = totalDeduction + MLDed4
    
    If (AttendanceValue - totalDeduction) < 0 Then
        CalculateDeduction = 0
    Else
        CalculateDeduction = AttendanceValue - totalDeduction
    End If

End Function

' ==========================================================================================
' EXPRESSION:
' ==========================================================================================
' =Code.CalculateDeduction(
'     Fields!ATTENDANCE.Value,
'     Round(Sum(Switch(Fields!REASON.Value = "UL", 1, Fields!REASON.Value = "SUL", 0.5, Fields!REASON.Value = "FUL", 0.5, True, 0), "STAFF_EMP_CODE")),
'     Sum(IIF(Fields!REASON.Value = "ABS", 1, 0), "STAFF_EMP_CODE"),
'     Sum(IIf(Fields!LATE.Value > 0, 1, 0), "STAFF_EMP_CODE"),
'     Sum(IIF(Fields!REASON.Value = "ML", 1, 0), "STAFF_EMP_CODE"),
'     Fields!UL_DED1.Value, Fields!UL_DED2.Value, Fields!UL_DED3.Value, Fields!UL_DED4.Value,
'     Fields!ATTN_DED1.Value, Fields!ATTN_DED2.Value, Fields!ATTN_DED3.Value, Fields!ATTN_DED4.Value,
'     Fields!LATE_DED1.Value, Fields!LATE_DED2.Value, Fields!LATE_DED3.Value, Fields!LATE_DED4.Value,
'     Fields!ML_DED1.Value, Fields!ML_DED2.Value, Fields!ML_DED3.Value, Fields!ML_DED4.Value
' )