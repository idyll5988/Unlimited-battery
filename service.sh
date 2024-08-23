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
#android SystemUI launcher 优化器
for a in $(pm list packages|grep android);do pm log-visibility --disable $a&dumpsys deviceidle whitelist +$a&am set-bg-restriction-level $a unrestricted&am service-restart-backoff enable $a&done& >/dev/null 2>&1&
for a in $(pm list packages|grep systemui);do pm log-visibility --disable $a&dumpsys deviceidle whitelist +$a&am set-bg-restriction-level $a unrestricted&am service-restart-backoff enable $a&done& >/dev/null 2>&1&
for a in $(pm list packages|grep launcher);do pm log-visibility --disable $a&dumpsys deviceidle whitelist +$a&am set-bg-restriction-level $a unrestricted&am service-restart-backoff enable $a&done& >/dev/null 2>&1&