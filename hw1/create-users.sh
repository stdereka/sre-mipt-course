curl -0 -v -X POST http://localhost:8080/api/v0/users \
-H "Expect:" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
"name": "s.petrov"
}
EOF
curl -0 -v -X PUT http://localhost:8080/api/v0/users/s.petrov \
-H "Expect:" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
"contacts": {
"call": "+7 111-111-1111",
"email": "s.petrov@student.com",
"slack": "s.petrov",
"sms": "+7 111-111-1111"
},
"full_name": "Sergey Petrov",
"photo_url": null,
"time_zone": "US/Pacific",
"active": 1
}
EOF


curl -0 -v -X POST http://localhost:8080/api/v0/users \
-H "Expect:" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
"name": "k.kostylev"
}
EOF
curl -0 -v -X PUT http://localhost:8080/api/v0/users/k.kostylev \
-H "Expect:" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
"contacts": {
"call": "+7 999-111-1111",
"email": "k.kostylev@student.com",
"slack": "k.kostylev",
"sms": "+7 999-111-1111"
},
"full_name": "Kostyl Kostylev",
"photo_url": null,
"time_zone": "US/Pacific",
"active": 1
}
EOF


curl -0 -v -X POST http://localhost:8080/api/v0/users \
-H "Expect:" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
"name": "v.velosipedov"
}
EOF
curl -0 -v -X PUT http://localhost:8080/api/v0/users/v.velosipedov \
-H "Expect:" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
"contacts": {
"call": "+7 666-111-1111",
"email": "v.velosipedov@student.com",
"slack": "v.velosipedov",
"sms": "+7 666-111-1111"
},
"full_name": "Velosiped Velosipedov",
"photo_url": null,
"time_zone": "US/Pacific",
"active": 1
}
EOF


curl -0 -v -X POST http://localhost:8080/api/v0/users \
-H "Expect:" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
"name": "c.666"
}
EOF
curl -0 -v -X PUT http://localhost:8080/api/v0/users/c.666 \
-H "Expect:" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
"contacts": {
"call": "+7 111-111-1111",
"email": "c.666@student.com",
"slack": "c.666",
"sms": "+7 111-111-1111"
},
"full_name": "Caladrius 666",
"photo_url": null,
"time_zone": "US/Pacific",
"active": 1
}
EOF
