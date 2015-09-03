import os
import bpy
import sys

fpath = "##PATH##"
fname = "##FILE##"
xaxis = ##XAXIS##
yaxis = ##YAXIS##

try:
    os.chdir(fpath)
except  (IOError):
    sys.exit()
    

bpy.ops.object.select_all(action='SELECT')
bpy.ops.object.delete()

for y in range(0, yaxis):
    for x in range(0, xaxis):
        if(x>0 or y>0):
            iname = "%s_x%dy%d.dae" % (fname, x, y)
        else:
            iname = "%s.dae" % (fname)
        
        #print "Opening File %s " % (iname)   
        
        try:
            bpy.ops.wm.collada_import(filepath=iname, import_units=True)
        except RuntimeError:
            pass
            

bpy.ops.object.select_all(action='SELECT')

#bpy.ops.object.select_by_layer(match='EXACT', extend=False, layers=1)
#bpy.ops.object.join()

oname = "%s_ALL.dae" % (fname)

bpy.ops.wm.collada_export(filepath=oname,
                            check_existing=False,
                            apply_modifiers=False,
                            selected=True,
                            include_children=False,
                            include_armatures=False,
                            include_shapekeys=False,
                            active_uv_only=True,
                            include_uv_textures=True,
                            include_material_textures=True,
                            use_texture_copies=False,
                            deform_bones_only=False,
                            open_sim=False,                                
                            triangulate=True,
                            use_object_instantiation=False,
                            sort_by_name=False
                            )




