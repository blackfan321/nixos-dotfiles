{ username, ... }:

{
  programs.zen-browser.profiles.${username}.spaces = {
    Home = {
      id = "6de57c7b-858d-4195-8d4a-895115ea4704";
      position = 1000;
      icon = "🏠️";
    };

    Work = {
      id = "58a2eed3-6e7f-433a-a53f-98e1382a02d8";
      position = 2000;
      icon = "💻️";
      container = 2;
      theme = {
        colors = [
          {
            red = 240;
            green = 168;
            blue = 196;
            algorithm = "floating";
            type = "explicit-lightness";
            lightness = 80;
          }
        ];
        opacity = 0.5;
      };
    };

    Ayakashigami = {
      id = "43dcb930-33f7-4047-9a6d-455865202320";
      position = 3000;
      icon = "📔";
      container = 1;
      theme = {
        colors = [
          {
            red = 107;
            green = 125;
            blue = 173;
            algorithm = "analogous";
            type = "explicit-lightness";
            lightness = 55;
          }
          {
            red = 144;
            green = 107;
            blue = 174;
            algorithm = "analogous";
            type = "explicit-lightness";
            lightness = 55;
          }
          {
            red = 107;
            green = 174;
            blue = 168;
            algorithm = "analogous";
            type = "explicit-lightness";
            lightness = 55;
          }
        ];
        opacity = 0.475;
      };
    };
  };
}
