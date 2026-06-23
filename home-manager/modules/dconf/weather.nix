{ lib, ... }:

let
  gv = lib.gvariant;

  belgorodLocation = gv.mkVariant (
    gv.mkTuple [
      (gv.mkUint32 2)
      (gv.mkVariant (
        gv.mkTuple [
          "Belgorod"
          ""
          false
          (gv.mkArray [
            (gv.mkTuple [
              0.8830565625
              0.638568455
            ])
          ])
          (gv.mkEmptyArray (
            gv.type.tupleOf [
              gv.type.double
              gv.type.double
            ]
          ))
        ]
      ))
    ]
  );

  weatherLocations = gv.mkArray [ belgorodLocation ];
in
{
  dconf.settings = {
    "org/gnome/Weather".locations = weatherLocations;

    "org/gnome/shell/weather" = {
      automatic-location = false;
      locations = weatherLocations;
    };
  };
}
