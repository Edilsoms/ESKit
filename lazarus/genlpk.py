#!/usr/bin/env python3
"""Gera eskit.lpk e o unit de pacote eskit.pas a partir de source/."""
import os, re, sys
root = os.path.dirname(os.path.abspath(__file__))
src = os.path.join(root, 'source')
order = ['esgraphics', 'estheme', 'esfxbase', 'esfxanimations', 'esfxshapes',
         'esfxstdctrls', 'esskins', 'eseditors', 'esgrid', 'esnavbar',
         'esribbon', 'esgridexport', 'estoolbargrid', 'esdb', 'esdboracle', 'eskitreg']
files = [f[:-4] for f in os.listdir(src) if f.endswith('.pas')]
units = [u for u in order if u in files] + sorted(u for u in files if u not in order)
compat_dir = os.path.join(src, 'compat')
compat = sorted(f[:-4] for f in os.listdir(compat_dir) if f.endswith('.pas'))

def unitname(u, d=None):
    with open(os.path.join(d or src, u + '.pas'), encoding='utf-8') as fh:
        m = re.search(r'^unit\s+([\w.]+)\s*;', fh.read(), re.M | re.I)
    return m.group(1)

items = []
for u in units:
    reg = '\n        <HasRegisterProc Value="True"/>' if u == 'eskitreg' else ''
    items.append(f'''      <Item>
        <Filename Value="source\\{u}.pas"/>{reg}
        <UnitName Value="{unitname(u)}"/>
      </Item>''')
for u in compat:
    items.append(f'''      <Item>
        <Filename Value="source\\compat\\{u}.pas"/>
        <UnitName Value="{unitname(u, compat_dir)}"/>
      </Item>''')
for r in ('eskit_images.res', 'toolbargrid_images.res'):
    items.append(f'''      <Item>
        <Filename Value="images\\{r}"/>
        <Type Value="Binary"/>
      </Item>''')

lpk = f'''<?xml version="1.0" encoding="UTF-8"?>
<CONFIG>
  <Package Version="6">
    <PathDelim Value="\\"/>
    <Name Value="ESKit"/>
    <Type Value="RunAndDesignTime"/>
    <AddToProjectUsesSection Value="True"/>
    <Author Value="ESKit contributors"/>
    <CompilerOptions>
      <Version Value="11"/>
      <PathDelim Value="\\"/>
      <SearchPaths>
        <OtherUnitFiles Value="source;source\\compat"/>
        <UnitOutputDirectory Value="lib\\$(TargetCPU)-$(TargetOS)\\$(LCLWidgetType)"/>
      </SearchPaths>
      <CodeGeneration>
        <Optimizations>
          <OptimizationLevel Value="2"/>
        </Optimizations>
      </CodeGeneration>
      <Other>
        <CustomOptions Value="$(IDEBuildOptions)"/>
      </Other>
    </CompilerOptions>
    <Description Value="ESKit: componentes inspirados no FireMonkey (TFx*: formas anti-aliased, animações, estilos) e no DevExpress (TSx*: grid com agrupamento/filtro/sumário, editores com botões, NavBar, Ribbon, skins)."/>
    <License Value="Modified LGPL"/>
    <Version Major="1"/>
    <Files>
{chr(10).join(items)}
    </Files>
    <RequiredPkgs>
      <Item>
        <PackageName Value="FCL"/>
      </Item>
      <Item>
        <PackageName Value="Printer4Lazarus"/>
      </Item>
      <Item>
        <PackageName Value="LCL"/>
      </Item>
    </RequiredPkgs>
    <UsageOptions>
      <UnitPath Value="$(PkgOutDir)"/>
    </UsageOptions>
    <PublishOptions>
      <Version Value="2"/>
    </PublishOptions>
  </Package>
</CONFIG>
'''
with open(os.path.join(root, 'eskit.lpk'), 'w', encoding='utf-8', newline='\r\n') as fh:
    fh.write(lpk)

names = [unitname(u) for u in units] + [unitname(u, compat_dir) for u in compat]
reg = 'eskitreg' in units
pas = '''{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ESKit;

{$warn 5023 off : no warning about unused units}
interface

uses
  ''' + ', '.join(names) + ''', LazarusPackageIntf;

implementation

procedure Register;
begin
''' + ("  RegisterUnit('ESKitReg', @ESKitReg.Register);\n" if reg else '') + '''end;

initialization
  RegisterPackage('ESKit', @Register);
end.
'''
with open(os.path.join(root, 'eskit.pas'), 'w', encoding='utf-8', newline='\r\n') as fh:
    fh.write(pas)
print('units:', ', '.join(names))
