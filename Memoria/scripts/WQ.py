# -*- coding: utf-8 -*-
"""
Created on Thu Apr 14 17:09:06 2022

@author: vivid
"""
import pandas as pd
# Load the template data
df = pd.read_excel('../data/data_template.xlsx', sheet_name='data_template') 
df
from wqchartpy import gibbs

gibbs.plot(df, unit='mg/L', figname='Gibbs diagram', figformat='jpg')

from wqchartpy import triangle_piper

triangle_piper.plot(df, unit='mg/L', figname='triangle Piper diagram', figformat='jpg')

from wqchartpy import color_piper

rgb = color_piper.plot(df, unit='mg/L', figname='color-coded Piper diagram', figformat='jpg')

from wqchartpy import contour_piper

# Because the contour-filled Piper is created for display large datasets. We below used the example dataset taken from Figure 2b of Moreno_Merino et al.(2021)
df_large = pd.read_excel('../data/data_template.xlsx', sheet_name='data_template') 

contour_piper.plot(df_large, unit='mg/L', figname='contour-filled Piper diagram', figformat='jpg')

from wqchartpy import stiff

stiff.plot(df, unit='mg/L', figname='Stiff diagram', figformat='jpg')

from wqchartpy import schoeller

schoeller.plot(df, unit='mg/L', figname='Schoeller diagram', figformat='jpg')