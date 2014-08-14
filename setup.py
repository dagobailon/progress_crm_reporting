from distutils.core import setup

setup(
    name='ProgressCRM_Reporting',
    version='0.1',
    packages=['progress_crm_reporting',],
    license='MIT',
    long_description='Progress CRM application to save frequently used queries, preview a report, export the report to a csv file enter and save a new query',
    install_requires= [
        'Django>=1.6.5',
    ],
)