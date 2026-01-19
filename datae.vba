=IIf(
    Fields!REASON.Value <> "OFF" AndAlso Fields!TIMEIN.Value <> 0,
    Fields!TIMEIN.Value,
    Nothing
)

=IIf(
    Fields!REASON.Value <> "OFF" AndAlso Fields!TIMEOUT.Value <> 0,
    Fields!TIMEOUT.Value,
    Nothing
)

=IIf(
    Fields!REASON.Value <> "OFF" AndAlso Fields!OT10.Value <> 0,
    Fields!OT10.Value,
    Nothing
)

=IIf(
    Fields!REASON.Value <> "OFF" AndAlso Fields!OT15.Value <> 0,
    Fields!OT15.Value,
    Nothing
)

=IIf(
    Fields!REASON.Value <> "OFF" AndAlso Fields!OT20.Value <> 0,
    Fields!OT20.Value,
    Nothing
)

=IIf(
    Fields!REASON.Value <> "OFF" AndAlso Fields!OT30.Value <> 0,
    Fields!OT30.Value,
    Nothing
)

=IIf(
    Fields!REASON.Value <> "OFF" AndAlso Fields!UNDER.Value <> 0,
    Fields!UNDER.Value,
    Nothing
)

=IIf(
    Fields!REASON.Value <> "OFF" AndAlso Fields!LATE.Value <> 0,
    Fields!LATE.Value,
    Nothing
)

=IIf(   
    Fields!REASON.Value <> "OFF" AndAlso Fields!OTHER.Value <> 0,
    Fields!OTHER.Value,
    Nothing
)
