--
-- Copyright (c) 2010 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
--
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation.
--

-- Top of every minute
INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'sync-probe-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='sync-probe-bunch'),
        sysdate, '0 * * * * ?');

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'errata-queue-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='errata-queue-bunch'),
        sysdate, '0 * * * * ?');

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'cobbler-sync-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='cobbler-sync-bunch'),
        sysdate, '0 * * * * ?');

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'channel-repodata-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='channel-repodata-bunch'),
        sysdate, '0 * * * * ?');

-- Every 10 minutes

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'package-cleanup-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='package-cleanup-bunch'),
        sysdate, '0 0/10 * * * ?');

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'kickstart-cleanup-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='kickstart-cleanup-bunch'),
        sysdate, '0 0/10 * * * ?');

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'errata-cache-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='errata-cache-bunch'),
        sysdate, '0 0/10 * * * ?');

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'kickstartfile-sync-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='kickstartfile-sync-bunch'),
        sysdate, '0 0/10 * * * ?');

-- Every 15 minutes

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'session-cleanup-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='session-cleanup-bunch'),
        sysdate, '0 0/15 * * * ?');

-- Once a day at 4:05:00 AM (beware of 2AM cronjobs)

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'sandbox-cleanup-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='sandbox-cleanup-bunch'),
        sysdate, '0 5 4 ? * *');

-- Once a day at 4:35:00 AM (beware of 2AM cronjobs)

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'clean-alerts-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='clean-alerts-bunch'),
        sysdate, '0 35 4 ? * *');

-- Once a day at 11:00 PM

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'daily-status-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='daily-status-bunch'),
        sysdate, '0 0 23 ? * *');

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'compare-configs-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='compare-configs-bunch'),
        sysdate, '0 0 23 ? * *');

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'satcert-check-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='satcert-check-bunch'),
        sysdate, '0 0 23 ? * *');

INSERT INTO rhnTaskoSchedule (id, job_label, bunch_id, active_from, cron_expr)
    VALUES(nextval('rhn_tasko_schedule_id_seq'), 'clear-taskologs-default',
        (SELECT id FROM rhnTaskoBunch WHERE name='clear-taskologs-bunch'),
        sysdate, '0 0 23 ? * *');
