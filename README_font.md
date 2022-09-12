# Fonts


* [Firacode NerdFonts](https://github.com/tonsky/FiraCode/wiki/Installing)



Old install script I had which is saved here for reference. TODO: check importance next time installing fonts.
```bash
#!/usr/bin/env bash

fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p "${fonts_dir}"
else
    echo "Found fonts dir $fonts_dir"
fi

version=5.2
zip=Fira_Code_v${version}.zip
curl --fail --location --show-error https://github.com/tonsky/FiraCode/releases/download/${version}/${zip} --output ${zip}
unzip -o -q -d ${fonts_dir} ${zip}
rm ${zip}

echo "fc-cache -f"
fc-cache -f
```
