﻿#language: ru

@tree
//Подготовка контекста
Функционал: Создание документа Заказ товаров (Задание 1)

Как Пользователь я хочу
создать документ Заказ товаров
чтобы зафиксировать потребность клиентов  


Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание документа Заказ товаров
* Открытие формы создания документа 
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Мелкооптовая'
* Заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Bosch1234'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1 000,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда таблица "Товары" стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Bosch1234' | '1 000,00' | '2'          | '2 000,00' |	
* Запись и проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровести'
	Тогда поле с именем "Номер" заполнено
* Проверка данных таблицы Товары 
	Тогда таблица "Товары" стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Bosch1234' | '1 000,00' | '2'          | '2 000,00' |

	 
//Проверка по заданию	
Функционал: Изменение поля Сумма при изменении поля Цена и Количество

Как Пользователь я хочу
при изменении поля Цена или Количество в табличной части Товары документа Заказ товаров система автоматически расчитывала поле Сумма
чтобы сократить трудозатраты на расчет и дополнительный ввод поля Сумма.




Сценарий: Проверка заполнения поля Сумма при изменении Цены или Количества
* Изменение поле цена
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2 000,00'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка изменения поля сумма
	Тогда таблица "Товары" стала равной:
		| 'Сумма'    |
		| '4 000,00' |
* Изменение поле количество
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка изменения поля сумма
	Тогда таблица "Товары" стала равной:
		| 'Сумма'    |
		| '6 000,00' |
* Закрытие формы заказа
	И Я закрываю окно 'Заказ * от * *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button0'
		