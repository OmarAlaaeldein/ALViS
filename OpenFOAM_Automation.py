import os
import shutil
from PyFoam.RunDictionary.ParsedParameterFile import ParsedParameterFile
n = int(input("Enter the number of generations in the lung bronchial tree: "))
# i need to move mesh files to trisurface
file_p = ParsedParameterFile("0/p")
file_p["internalField"] = "uniform 0.001"
file_p["boundaryField"]["inlet"]["type"] = "zeroGradient"
for i in range(1, 2 ** n + 1):
    file_p["boundaryField"]["outlet_{}".format(i)] = {"type": "fixedValue",
                                            "value": "$internalField"}
file_p["boundaryField"]["lung"] = {"type": "zeroGradient"}
file_p.writeFile()

file_U = ParsedParameterFile("0/U")
file_U["boundaryField"]["inlet"] = {"type": "fixedValue",
                       "value": "uniform (0 0 -0.125)"}

for i in range(1, 2 ** n + 1):
    file_U["boundaryField"]["outlet_{}".format(i)] = {"type": "zeroGradient"}
file_U["boundaryField"]["lung"] = {"type": "noSlip"}
file_U.writeFile()
snappy_file = ParsedParameterFile("system/snappyHexMeshDict")
snappy_file["geometry"]["lung"] = {"type": "triSurfaceMesh",
                                   "file": '"{}"'.format("open_ended_all_bodyer.stl")}
snappy_file["geometry"]["inlet"] = {"type": "triSurfaceMesh",
                                    "file": '"{}"'.format("inleter.stl")}
feat=[]                                   
snappy_file["castellatedMeshControls"]["features"]=()                                    
feat.append(
        {
        "file": '"{}"'.format("open_ended_all_bodyer.extendedFeatureEdgeMesh"),
        "level": "0"
        }
    )
feat.append(
        {
        "file": '"{}"'.format("inleter.extendedFeatureEdgeMesh"),
        "level": "0"
      }
    )

snappy_file["castellatedMeshControls"]["refinementSurfaces"]['lung']={'level':'(2 2)'}
snappy_file["castellatedMeshControls"]["refinementSurfaces"]['inlet']={'level':'(2 2)'}
snappy_file["castellatedMeshControls"]["refinementSurfaces"]['inlet']['patchInfo']={'type': 'patch'}
snappy_file["addLayersControls"]["layers"]['"lung_.*"']={"nSurfaceLayers" : "1"}
snappy_file["addLayersControls"]["layers"]['"inlet_.*"']={"nSurfaceLayers" : "1"}

for i in range(1, 2 ** n + 1):
    outlet_name = "outlet_{}".format(i)
    edgemesh="alv_{}_outleter.extendedFeatureEdgeMesh".format(i)
    outlet_file = "alv_{}_outleter.stl".format(i)
    snappy_file["geometry"][outlet_name] = {"type": "triSurfaceMesh", "file": '"{}"'.format(outlet_file)}
    
    
    feat.append(
        {
        "file": '"{}"'.format(edgemesh),
        "level": "0"
        }
    )
    snappy_file["addLayersControls"]["layers"]['"outlet_{}.*"'.format(i)]={"nSurfaceLayers" : "1"}
    snappy_file["castellatedMeshControls"]["refinementSurfaces"][outlet_name]={'level':'(2 2)'}
    snappy_file["castellatedMeshControls"]["refinementSurfaces"][outlet_name]['patchInfo']={'type': 'patch'}
feat.append(')')    
snappy_file["castellatedMeshControls"]["features ("]=tuple(feat)

snappy_file.writeFile()
file_surface = ParsedParameterFile("system/surfaceFeaturesDict")
l=[]

l.append('"open_ended_all_bodyer.stl"')
l.append('"inleter.stl"')
file_surface['surfaces']=()
#print(file_surface['surfaces'])
for i in range(1, 2 ** n + 1):
    outlet_file = '"alv_{}_outleter.stl"'.format(i)
    l.append(outlet_file)
l.append(')')
file_surface['surfaces (']=tuple(l)
file_surface.writeFile()