<?php
# データベース作り直しするかどうか
$reset = true;


$database = 'flower';


$tables = [
        [
            'name' => 'sqllog',
            'col' =>[
                    [
                        'name' =>'id',
                        'type' => 'BIGINT',
                        'attr' => 'UNSIGNED AUTO_INCREMENT'
                    ], 
                    [
                        'name' => 'sql',
                        'type' => 'TEXT',
                        'attr' => NULL
                    ],
                    [
                        'name' => 'date',
                        'type'=> 'TIMESTAMP',
                        'attr' => 'NOT NULL DEFAULT CURRENT_TIMESTAMP'
                    ]
            ],
        'pkey' => [0]
        ],
        [
            'name' => 'flower',
            'col' =>[
                    [
                        'name' => 'id',
                        'type' => 'INT',
                        'attr' => 'UNSIGNED AUTO_INCREMENT'
                    ],
                    [
                        'name' => 'name',
                        'type' => 'VARCHAR(255)',
                        'attr' => 'NOT NULL UNIQUE'
                    ],
                    [
                        'name' => 'count',
                        'type' => 'INT',
                        'attr' => 'NOT NULL DEFAULT 0'
                    ]
                    ],
        'pkey' => [0],
        'data' => [
                'cols' => [1,2],
                'values' > [
                    ['Rose', 4],
                    ['SunFlower', 7],
                    ['Tulip', 5]
                        ]
                ]
        ]
    ];
    
    
    require_once 'modelEx.php';
    
    
    include 'showData.php';
    
    
    $json = [
            'reult' => '初期化完了',
            'html' => $html
    ];
    echo json_encode($json);
    ?>