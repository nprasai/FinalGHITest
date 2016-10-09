# Project : Global Hunger Index 2015
# -----------------------------------------------------------------------------
# Author : Ricardo Lafuente <ricardo@jplusplus.org>
# -----------------------------------------------------------------------------
# License : GNU General Public License
# -----------------------------------------------------------------------------

install:
	virtualenv .env --no-site-packages --distribute --prompt=\(ghi\)
	. `pwd`/.env/Scripts/activate; pip install -r requirements.txt
	cd site; npm install; bower install

build:
	. `pwd`/.env/Scripts/activate; cd tools; python generate_geojson.py && python render_templates.py
	cd site; gulp build

serve:
	cd site; gulp watch

deploy:
	cd site; gulp deploy

clean:
	rm -fr site/dist

live:
	command cp -r site/dist/* ../Global-Hunger-Index
	cd ../Global-Hunger-Index; git add .; git commit -m "New live version"; git push origin gh-pages

