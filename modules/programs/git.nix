{pkgs, ...}: 

{
  programs.git = {
    enable = true;
    userName = "Fisky";
    userEmail = "mcfisk@ymail.com";
    aliases = {
      st = "status";
    };
  };
}
