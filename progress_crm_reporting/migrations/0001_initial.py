# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Query'
        db.create_table(u'progress_crm_reporting_query', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('query', self.gf('django.db.models.fields.CharField')(max_length=500)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('description', self.gf('django.db.models.fields.TextField')()),
        ))
        db.send_create_signal(u'progress_crm_reporting', ['Query'])


    def backwards(self, orm):
        # Deleting model 'Query'
        db.delete_table(u'progress_crm_reporting_query')


    models = {
        u'progress_crm_reporting.query': {
            'Meta': {'object_name': 'Query'},
            'description': ('django.db.models.fields.TextField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'query': ('django.db.models.fields.CharField', [], {'max_length': '500'})
        }
    }

    complete_apps = ['progress_crm_reporting']