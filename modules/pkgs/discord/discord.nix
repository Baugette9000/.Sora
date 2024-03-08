{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
	(pkgs.discord.override {
 	   withVencord = true;
	})
    ];	
}
