import yaml 
import io
import argparse


def settings_file(DepthMapFactor, nFeatures):

    data = {
    'Camera.fx': 520.908620, 
    "Camera.fy": 521.007327, 
    "Camera.cx": 325.141442, 
    "Camera.cy": 249.701764, 
    'Camera.k1': 0.231222, 
    'Camera.k2': -0.784899, 
    'Camera.p1': -0.003257 ,
    'Camera.p2': -0.000105,
    
    'Camera.k3': 0.917205

    'Camera.width': 640,
    'Camera.height': 480,
        

    'Camera.fps': 30.0,
    
    
    'Camera.bf': 40.0,
    
    'Camera.RGB': 1,
    
    'ThDepth': 40.0,
    
    'DepthMapFactor': DepthMapFactor,
    
    'ORBextractor.nFeatures': nFeatures,
    
    'ORBextractor.scaleFactor': 1.2,
    
    'ORBextractor.nLevels': 8,
    
    'ORBextractor.iniThFAST': 20,
    'ORBextractor.minThFAST': 7,
    
    'Viewer.KeyFrameSize': 0.05,
    'Viewer.KeyFrameLineWidth': 1,
    'Viewer.GraphLineWidth': 0.9,
    'Viewer.PointSize':2,
    'Viewer.CameraSize': 0.08,
    'Viewer.CameraLineWidth': 3,
    'Viewer.ViewpointX': 0,
    'Viewer.ViewpointY': -0.7,
    'Viewer.ViewpointZ': -1.8,
    'Viewer.ViewpointF': 500
    }

    return data




def write_settings_file(FilePath):
    
    with io.open(str(FilePath), 'w', encoding='utf8') as outfile:
        a="%YAML:1.0 "
        outfile.write(a.decode('unicode-escape')+'\n')
        yaml.dump(data, outfile, default_flow_style=False, allow_unicode=True)
    return None


if __name__ == '__main__':

    # parse command line
    parser = argparse.ArgumentParser(description='''
    This script takes camera settings and writes them in a .yaml file  
    ''')
    parser.add_argument('SettingsPath', help='Output settings file path')
    parser.add_argument('--DepthMapFactor', help='Depthmap values factor',default=5000.0)
    parser.add_argument('--nFeatures', help='ORB Extractor: Number of features per image', default=1000)
    args = parser.parse_args()
    
    data=settings_file(float(args.DepthMapFactor), float(args.nFeatures))
    write_settings_file(args.SettingsPath)
    
