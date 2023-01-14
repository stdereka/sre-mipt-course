# HW 7

## Установка Grafana

Следуя инструкции с офсайта, я подготовил скрипт `install.sh`.
Прикладываю скриншот с первого запуска:

![grafana.png](grafana.png)

## Настройка

Для выставления требуемых настроек потребовалость внести следующие изменения
в `/etc/grafana/grafana.ini`:

```yaml
[dashboards]
versions_to_keep = 30
[users]
default_theme = dark
[date_formats]
default_timezone = Europe/Moscow
```

После перезапуска настройки применяются:

![timezone.png](timezone.png)

## Смотрим на метрики

Подключим в качестве сурса Prometheus и выведем `prometheus_tsdb_head_series` в Grafana:
![grafana-metric.png](grafana-metric.png)

В задании просят также посмотреть чем-то отличным от Grafana. Построим
тот же самый график в самом Prometheus:

![prometheus-metric.png](prometheus-metric.png)
