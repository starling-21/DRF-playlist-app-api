# Makefile
## 🌶 Django and hot-reload
run:
	docker-compose run --rm --publish 80:80 app python manage.py runserver 0.0.0.0:80

debug:
	docker-compose run --rm --publish 80:80 app python -m debugpy --wait-for-client --listen 0.0.0.0:5678 manage.py runserver 0.0.0.0:80

test:
	docker-compose run --rm app sh -c "python manage.py test --noinput"

lint:
	docker-compose run --rm app sh -c "flake8 --ignore=E501"

both:
	docker-compose run --rm app sh -c "python manage.py test && flake8 --ignore=E501"

migrate:
	docker-compose run --rm --publish 80:80 app sh -c "python manage.py makemigrations core"

build:
	docker-compose build