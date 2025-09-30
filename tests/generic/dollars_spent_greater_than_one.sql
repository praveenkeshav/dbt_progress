{% test dollars_spent_greater_than_one(model, column_name, group_by_column) %}

    SELECT 
        {{ group_by_column }},
        AVG({{ column_name }}) AS average_amount
    FROM {{ model }}
    GROUP BY {{ group_by_column }}
    HAVING AVG({{ column_name }}) <= 0.5

{% endtest %}