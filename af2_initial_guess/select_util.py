import logging
import shutil
from collections import defaultdict
from pathlib import Path
from typing import Union
from pandas import DataFrame

logger = logging.getLogger()
logging.basicConfig(
    level=logging.INFO,
    datefmt="%y-%m-%d %H:%M",
    format="%(asctime)s %(filename)s %(lineno)d: %(message)s",
)


def select_high_potentials(
    af_pred_pdb_dir,
    score_fn="out.sc",
    out_dir:Union[str, Path, None]=None,
    thereshold=10,
    thereshold_field="pae_interaction",
    larger_is_better=False,
):
    """pae_interaction < 10 is selected as high potential"""
    results = defaultdict(list)
    with open(score_fn, "r", encoding="utf-8") as f:
        for i, line in enumerate(f):
            if i == 0:
                fields = line.split()[1:]
            else:
                values = line.split()[1:]
                for j, value in enumerate(values):
                    if j < len(values) - 1:
                        value = float(value)
                    results[fields[j]].append(value)
    df = DataFrame(results)
    if larger_is_better:
        selected_df = df[df[thereshold_field] > thereshold]
    else:
        selected_df = df[df[thereshold_field] < thereshold]
    logger.info(f"All {thereshold_field} summary\n{df[thereshold_field].describe()}")
    logger.info(f"{len(selected_df) = }")
    af_pred_pdb_dir = Path(af_pred_pdb_dir)
    if out_dir is None:
        out_dir = af_pred_pdb_dir.with_name(f"{af_pred_pdb_dir.name}_selected")
    else:
        out_dir = Path(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    selected_df.to_csv(out_dir / "summary.csv")
    for file in af_pred_pdb_dir.glob("*.pdb"):
        if file.stem in selected_df["description"].values:
            shutil.copy(file, out_dir)
    return selected_df


if __name__ == "__main__":
    select_high_potentials("examples/inputs/pdbs", "tmp")
