import os

from mangum import Mangum
from datasette.app import Datasette

stage = os.environ.get('STAGE', None)

config = {
  'base_url': f"/{stage}/"
}

datasette = Datasette(
    files=['db.sqlite'],
    immutables=[],
    config=config,
    cache_headers=True,
    cors=True,
    inspect_data=None,
    sqlite_extensions=['spatialite'],
    template_dir=None,
    plugins_dir=None,
    static_mounts=None,
    memory=False,
    version_note=None
)

app = datasette.app()
handler = Mangum(app)
