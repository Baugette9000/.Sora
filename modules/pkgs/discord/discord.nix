{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
	(pkgs.discord-ptb.override {
 	   withVencord = true;
	})
    ];	
}
