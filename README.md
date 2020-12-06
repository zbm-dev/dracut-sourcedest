# 00sourcedest

A simple Dracut module used to install arbitrary files to arbitrary paths in the initramfs.

## Usage

```
cp -Rvp 00sourcedest /usr/lib/dracut/modules.d/10sourcedest-early
echo "req,/a/file/that/must/exist,/sbin/file" >> /etc/default/10sourcedest-early
echo "opt,/a/file/that/might/exist,/bin/file" >> /etc/default/10sourcedest-early
echo 'add_dracutmodules+=" sourcedest-early "' >> /etc/dracut.conf.d/sourcedest.conf
```

Create as many instances under `/usr/lib/dracut/modules.d/` as needed. Set the name to be late in the build process to override files other modules include.
