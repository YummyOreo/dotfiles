import yaml
import sys

print(sys.argv)
config = {}
with open("C:\\Users\\OreoD\\AppData\\Roaming\\alacritty\\alacritty.yml", "r") as stream:
    config = yaml.safe_load(stream)
    config["window"]["opacity"] = float(sys.argv[1])
with open('C:\\Users\\OreoD\\AppData\\Roaming\\alacritty\\alacritty.yml', 'w') as outfile:
    yaml.dump(config, outfile, default_flow_style=False)

