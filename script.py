# Import yaml module

import yaml
import argparse

parser = argparse.ArgumentParser()
print(parser)

with open('config.yml', 'r') as file:
    config = yaml.safe_load(file)

print(config['type'], config['version'])


