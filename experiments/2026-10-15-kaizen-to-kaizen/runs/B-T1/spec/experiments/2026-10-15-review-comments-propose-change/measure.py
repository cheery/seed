#!/usr/bin/env python3
"""Rounds per review, split by new contributor and by whether every
comment proposed a change.  Usage: measure.py reviews.log [first_id [last_id]]"""
import sys

def rows(path, first=None, last=None):
    for line in open(path):
        if line.startswith('#') or not line.strip():
            continue
        f = line.rstrip('\n').split('\t')
        if first and f[0] < first: continue
        if last and f[0] > last: continue
        yield dict(id=f[0], new=f[2] == 'yes', rounds=int(f[6]),
                   comments=int(f[7]), proposing=int(f[8]))

def mean(xs):
    return sum(xs) / len(xs) if xs else float('nan')

rs = list(rows(*sys.argv[1:4]))
new = [r['rounds'] for r in rs if r['new']]
est = [r['rounds'] for r in rs if not r['new']]
print(f"reviews              {len(rs)}")
print(f"mean rounds          {mean([r['rounds'] for r in rs]):.2f}")
print(f"  new contributor    {mean(new):.2f}  (n={len(new)})")
print(f"  established        {mean(est):.2f}  (n={len(est)})")
# weighted to the baseline mix R01-R20: 9 new, 11 established
print(f"mix-adjusted rounds  {(9*mean(new) + 11*mean(est)) / 20:.2f}")
c = sum(r['comments'] for r in rs); p = sum(r['proposing'] for r in rs)
print(f"comments proposing   {p}/{c} = {p/c:.0%}")
for label, test in (("all comments propose", lambda r: r['proposing'] == r['comments']),
                    ("not all propose", lambda r: r['proposing'] < r['comments'])):
    for who, isnew in (("new", True), ("established", False)):
        xs = [r['rounds'] for r in rs if test(r) and r['new'] == isnew]
        print(f"  {label:21s} {who:12s} {mean(xs):.2f}  (n={len(xs)})")
