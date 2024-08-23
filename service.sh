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
for a in $(pm list packages|grep -w 'android');do am set-bg-restriction-level $a unrestricted&done& >/dev/null 2>&1&
for a in $(pm list packages|grep -w 'com.android.systemui');do am set-bg-restriction-level $a unrestricted&done& >/dev/null 2>&1&
for a in $(pm list packages|grep -w 'com.android.settings');do am set-bg-restriction-level $a unrestricted&done& >/dev/null 2>&1&
for a in $(pm list packages|grep -w 'com.sec.android.app.launcher');do am set-bg-restriction-level $a unrestricted&done& >/dev/null 2>&1&