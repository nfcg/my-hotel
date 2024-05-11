<?php return array(
    'root' => array(
        'pretty_version' => '1.0.0+no-version-set',
        'version' => '1.0.0.0',
        'type' => 'library',
        'install_path' => __DIR__ . '/../../',
        'aliases' => array(),
        'reference' => NULL,
        'name' => '__root__',
        'dev' => true,
    ),
    'versions' => array(
        '__root__' => array(
            'pretty_version' => '1.0.0+no-version-set',
            'version' => '1.0.0.0',
            'type' => 'library',
            'install_path' => __DIR__ . '/../../',
            'aliases' => array(),
            'reference' => NULL,
            'dev_requirement' => false,
        ),
        'smarty/smarty' => array(
            'pretty_version' => 'dev-master',
            'version' => 'dev-master',
            'type' => 'library',
            'install_path' => __DIR__ . '/../smarty/smarty',
            'aliases' => array(
                0 => '5.0.x-dev',
            ),
            'reference' => '293bc20db0f30de54db663ae238c681af90847d9',
            'dev_requirement' => false,
        ),
        'symfony/polyfill-mbstring' => array(
            'pretty_version' => 'v1.29.0',
            'version' => '1.29.0.0',
            'type' => 'library',
            'install_path' => __DIR__ . '/../symfony/polyfill-mbstring',
            'aliases' => array(),
            'reference' => '9773676c8a1bb1f8d4340a62efe641cf76eda7ec',
            'dev_requirement' => false,
        ),
    ),
);
