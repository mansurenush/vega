# Оценка сентимента сообщений из телеграм-каналов для прогнозирования направления курса акций

Этот проект направлен на анализ сентимента сообщений из телеграм-каналов, в которых упоминаются компании. Для анализа сентимента используются различные модели, а упоминания компаний находятся через regex/NER. Используются как ручная разметка, так и few-shot learning с использованием ChatGPT через API OpenAI для обучения и оценки.

## Содержание

- [Введение](#введение)
- [Сбор данных](#сбор-данных)
- [Определение упоминаний компаний](#определение-упоминаний-компаний)
  - [Подход на основе регулярных выражений (Regex)](#подход-на-основе-регулярных-выражений-regex)
  - [Распознавание именованных сущностей (NER)](#распознавание-именованных-сущностей-ner)
- [Оценка сентимента](#оценка-сентимента)
  - [Базовая модель: Логистическая регрессия](#базовая-модель-логистическая-регрессия)
  - [CatBoost](#catboost)
  - [Fine-tuned BERT](#fine-tuned-bert)

## Введение

Цель проекта - исследовать, как сентимент сообщений телеграм каналов влияет на цену акций российских компаний.

## Сбор данных

Данные состоят из сообщений, собранных из различных телеграм-каналов. Каждое сообщение проверяется на наличие упоминаний компаний.

## Определение упоминаний компаний

### Подход на основе регулярных выражений (Regex)

Подход основывается на заранее определенных шаблонах и вариациях названий компаний для их поиска и извлечения.

### Распознавание именованных сущностей (NER)

Для нахождения упоминаний компаний в сообщениях используется модель распознавания именованных сущностей (NER). Была использована модель Natasha(cpu).

## Оценка сентимента

### Базовая модель: Логистическая регрессия

В качестве базовой модели для оценки сентимента используется простая логистическая регрессия. 

### CatBoost

Для сравнения используется CatBoost. 

### Fine-tuned BERT

Для оценки сентимента используется модель BERT, дообученная на вручную размеченном наборе данных.
