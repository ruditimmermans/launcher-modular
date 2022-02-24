#!/bin/bash

mount -o rw,remount /

sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.android.calculator2.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.android.camera2.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.android.contacts.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.android.deskclock.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.android.documentsui.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.android.email.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.android.gallery3d.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.android.inputmethod.latin.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.android.settings.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.aurora.store.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.com.google.android.gms.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.org.fdroid.fdroid.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.org.lineageos.eleven.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.org.lineageos.etar.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.org.lineageos.jelly.desktop
sed -i '/NoDisplay=true/d' /home/phablet/.local/share/applications/waydroid.org.lineageos.recorder.desktop

mount -o ro,remount /
