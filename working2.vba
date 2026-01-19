=Sum(
    IIf(Fields!REASON.Value <> "OFF" And Not IsNothing(Fields!TIMEIN.Value) And Not IsNothing(Fields!TIMEOUT.Value),
        IIf(
            (
             ((Int(Val(Fields!TIMEOUT.Value) / 100) * 60) + (Val(Fields!TIMEOUT.Value) Mod 100)) - 
             ((Int(Val(Fields!TIMEIN.Value) / 100) * 60) + (Val(Fields!TIMEIN.Value) Mod 100))
            ) / 60 >= 8, 
            1, 
            0
        ),
        0
    )
)