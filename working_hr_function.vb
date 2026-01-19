Public Function CalculateWorkingDays8( _
    ByVal reason As String, _
    ByVal workingHrs As Double, _
    ByVal days As Double, _
) As Double

    Dim totalWorkDays As Double
    totalWorkDays = days

    If reason <> "OFF" AND workingHrs >= 8 AND workingHrs < 12 Then
        totalWorkDays = totalWorkDays + 1
    End If

End Function
