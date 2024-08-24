#!/system/bin/sh
[ ! "$MODDIR" ] && MODDIR=${0%/*}
while [[ "$(getprop sys.boot_completed)" -ne 1 ]] && [[ ! -d "/sdcard" ]]; do
sleep 1
done
while [[ `getprop sys.boot_completed` -ne 1 ]]; do
sleep 1
done
sdcard_rw() {
until [[ $(getprop sys.boot_completed) -eq 1 || $(getprop dev.bootcomplete) -eq 1 ]]; do
sleep 1
done
}
sdcard_rw
for a in $(pm list packages -s | grep -E 'com.android.systemui|com.sec.android.app.launcher'); do
    su root -c "su -c \"am set-battery-restriction-level $a unrestricted\"" &
done >/dev/null 2>&1