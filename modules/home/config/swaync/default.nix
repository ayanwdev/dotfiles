{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "bottom";
      layer = "overlay";
    };
    style = ''
      .notification {
        background-color: #16161e;
        border-radius: 0;
      }
    '';
  };
}
