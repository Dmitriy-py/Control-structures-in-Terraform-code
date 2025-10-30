# Домашнее задание к занятию «Управляющие конструкции в коде Terraform»

## `Дмитрий Климов`

## Задание 1

Изучите проект.
Инициализируйте проект, выполните код.
Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud .

## Ответ:

<img width="1920" height="1080" alt="Снимок экрана (1688)" src="https://github.com/user-attachments/assets/fd41435c-d38c-4d54-996e-11472caab70f" />

## Задание 2

Создайте файл count-vm.tf. Опишите в нём создание двух одинаковых ВМ web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент count loop. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" разных по cpu/ram/disk_volume , используя мета-аргумент for_each loop. Используйте для обеих ВМ одну общую переменную типа:

```terraform
variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
}
```
При желании внесите в переменную все возможные параметры. 4. ВМ из пункта 2.1 должны создаваться после создания ВМ из пункта 2.2. 5. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2. 6. Инициализируйте проект, выполните код.

## Ответ:

<img width="1920" height="1080" alt="Снимок экрана (1689)" src="https://github.com/user-attachments/assets/47ebb74f-64ed-4f94-90ec-7231cdc1e25b" />

### Ссылка: https://github.com/Dmitriy-py/Control-structures-in-Terraform-code/tree/4a2662c78a0ccbfac8395378ac42bb60301ad565/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%E2%84%962


## Задание 3

Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .
Создайте в том же файле одиночную(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage" . Используйте блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

## Ответ:

<img width="1920" height="1080" alt="Снимок экрана (1690)" src="https://github.com/user-attachments/assets/b30d19f5-1b05-48da-aa44-d074fa372aae" />

### Ссылка: https://github.com/Dmitriy-py/Control-structures-in-Terraform-code/tree/efb4df0e6e50a2fb4ba473b96357e20824d1a502/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%E2%84%963


## Задание 4

В файле ansible.tf создайте inventory-файл для ansible. Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции. Готовый код возьмите из демонстрации к лекции demonstration2. Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
Инвентарь должен содержать 3 группы и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
Добавьте в инвентарь переменную fqdn.
[webservers]
web-1 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
web-2 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[databases]
main ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
replica ansible_host<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>

[storage]
storage ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
Пример fqdn: web1.ru-central1.internal(в случае указания переменной hostname(не путать с переменной name)); fhm8k1oojmm5lie8i22a.auto.internal(в случае отсутвия перменной hostname - автоматическая генерация имени, зона изменяется на auto). нужную вам переменную найдите в документации провайдера или terraform console. 4. Выполните код. Приложите скриншот получившегося файла.

Для общего зачёта создайте в вашем GitHub-репозитории новую ветку terraform-03. Закоммитьте в эту ветку свой финальный код проекта, пришлите ссылку на коммит.
Удалите все созданные ресурсы.

## Ответ:

<img width="1920" height="1080" alt="Снимок экрана (1691)" src="https://github.com/user-attachments/assets/79919e78-4ef9-4e47-9fa9-a85262b0390c" />

### Ссылка: https://github.com/Dmitriy-py/Control-structures-in-Terraform-code/tree/e32b8bbac48a850d7187d483fd6af3c1adac1247/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%E2%84%964

### Ссылка: https://github.com/Dmitriy-py/ter-homeworks/tree/terraform-03

Задание 5* (необязательное)
Напишите output, который отобразит ВМ из ваших ресурсов count и for_each в виде списка словарей :
[
 {
  "name" = 'имя ВМ1'
  "id"   = 'идентификатор ВМ1'
  "fqdn" = 'Внутренний FQDN ВМ1'
 },
 {
  "name" = 'имя ВМ2'
  "id"   = 'идентификатор ВМ2'
  "fqdn" = 'Внутренний FQDN ВМ2'
 },
 ....
...итд любое количество ВМ в ресурсе(те требуется итерация по ресурсам, а не хардкод) !!!!!!!!!!!!!!!!!!!!!
]
Приложите скриншот вывода команды terrafrom output.

<img width="1920" height="1080" alt="Снимок экрана (1694)" src="https://github.com/user-attachments/assets/07bba1e4-fd6d-47ec-b90c-01fdeb59f863" />

### Ссылка: https://github.com/Dmitriy-py/Control-structures-in-Terraform-code/tree/da81cbbaa3e8f92f2a2d3c2564465f42062a59db/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%E2%84%965

<img width="1920" height="1080" alt="Снимок экрана (1695)" src="https://github.com/user-attachments/assets/5fac8d36-daab-41f3-a002-f8d964154f4b" />




















