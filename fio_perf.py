"""
This module is used to execute benchmarks for ScaleIO across multi-node clusters
"""

__author__ = "edhenry"
__copyright__ = "Copyright 2018, Dell Technologies"
__credits__ = ["Ed Henry", "Paul Kingston", "Dilip Tailor"]

__version__ = "0.1"
__maintainer__ = "Ed Henry"
__email__ = "Ed_Henry@dell.com"


import yaml
import os
import time
import subprocess

def collect_host_config(config_file):
    """
    Collect the host configuration(s) that this script is run on
    :param config_file: YAML Config file containing host information to collect
    :return: dictionary of host configs
    """

    config = parse_yaml_file('config.yaml')


def scaleio_network_test(config):
    """
    Test ScaleIO throughput using ScaleIO CLI
    :param config: configuration for ScaleIO CLI args
    :return: blob of results
    """




def parse_yaml_file(file):
    """
    Parse and return YAML configuration file for script

    :param file: yaml file and directory mapping to where the file lives within your file system
    :return: yaml data structure
    """

    with open(file, 'r') as stream:
        try:
            return yaml.load(stream=stream)
        except:
            print("Failed to parse configuration file.")

def run_fio_test(config):
    """
    Execute an FIO benchmark; sane defaults provided in lieu of configuration
    :param config: configuration construct for FIO utility
    :return: None
    """

def write_results(filename):
    """
    Write the benchmark results to a filename
    :param filename: filename and location on file system where we would like to store our results
    :return: None
    """


def output_graphs(results):
    """
    Generate graphs from the results of a given benchmark
    :param results:
    :return:
    """

## Main method
if __name__ == '__main__':
    parse_config('config.yaml')