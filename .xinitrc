export SSH_AUTH_SOCK
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'

#Toolbar for anthy
ibus-daemon -drx
exec /home/julius/.config/startup.sh &
exec stumpwm
