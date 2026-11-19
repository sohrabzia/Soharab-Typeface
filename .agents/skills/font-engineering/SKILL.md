---
name: font-engineering
description: >-
  Inspect, subset, optimize, and convert TrueType/OpenType variable fonts into WOFF2 formats,
  audit variation axes, and manage font tables.
---

# Font Engineering & Optimization Skill

Use this skill when inspecting, converting, subsetting, or optimizing TrueType (`.ttf`) and OpenType (`.otf`) variable font files for modern web delivery.

---

## 1. Converting TTF to WOFF2 for Production Web Delivery

Variable TrueType fonts (`.ttf`) can be compressed into WOFF2 using Google's Brotli algorithm, typically reducing file size by 50% to 70%.

### Using Python `fonttools` and `brotli`
```bash
# Install fonttools and brotli
pip install fonttools brotli

# Convert Soharab-VF.ttf to WOFF2
fonttools ttLib.woff2 compress Soharab-VF.ttf -o Soharab-VF.woff2

# Convert static cut to WOFF2
fonttools ttLib.woff2 compress Soharab.ttf -o Soharab.woff2
```

### Verification
Check resulting file sizes:
```bash
ls -lh *.ttf *.woff2
```
Expected reduction:
- `Soharab-VF.ttf`: 43.9 KB → `Soharab-VF.woff2`: ~18–22 KB
- `Soharab.ttf`: 12.6 KB → `Soharab.woff2`: ~6–8 KB

---

## 2. Inspecting Variable Axes and Font Tables

To inspect the variation axes (`fvar`), named instances, and font metadata:

### Quick Python Inspection Script
```python
from fontTools.ttLib import TTFont

font = TTFont('Soharab-VF.ttf')

# 1. Inspect Variation Axes
if 'fvar' in font:
    fvar = font['fvar']
    print("--- Variation Axes ---")
    for axis in fvar.axes:
        print(f"Tag: {axis.axisTag}, Min: {axis.minValue}, Default: {axis.defaultValue}, Max: {axis.maxValue}")
    
    print("\n--- Named Instances ---")
    for inst in fvar.instances:
        name = font['name'].getDebugName(inst.subfamilyNameID)
        coords = inst.coordinates
        print(f"Instance: {name} -> {coords}")

# 2. Inspect Glyph Count & Glyph Names
glyphs = font.getGlyphOrder()
print(f"\nTotal Glyphs: {len(glyphs)}")
```

### Dump Font Tables to XML (TTX)
```bash
# Dump fvar table only
ttx -t fvar Soharab-VF.ttf

# Dump name table only
ttx -t name Soharab-VF.ttf
```

---

## 3. Subsetting Glyphs with `pyftsubset`

To generate localized or stripped-down cuts of the font (e.g., ASCII-only or specific language subsets):

```bash
# Subset Latin Basic characters + digits + common punctuation
pyftsubset Soharab-VF.ttf \
  --unicodes="U+0020-007E" \
  --layout-features="*" \
  --variable-tables="*" \
  --flavor=woff2 \
  --output-file=Soharab-VF.basic.woff2
```

Flags explained:
- `--variable-tables="*"`: Crucial! Retains `fvar`, `gvar`, `HVAR`, and `STAT` tables so the variable font retains its dynamic axes.
- `--flavor=woff2`: Automatically compresses the subsetted output into WOFF2.

---

## 4. Modern CSS Implementation Patterns

Once WOFF2 is generated, update `@font-face` with format prioritization:

```css
@font-face {
  font-family: 'Soharab';
  src: url('./Soharab-VF.woff2') format('woff2-variations'),
       url('./Soharab-VF.woff2') format('woff2'),
       url('./Soharab-VF.ttf') format('truetype');
  font-weight: 100 900;
  font-style: oblique 0deg 12deg;
  font-display: swap;
}
```
