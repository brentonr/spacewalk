--
-- Copyright (c) 2008 Red Hat, Inc.
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
--
--$Id$
--
--

--physical_location current prod row count = 189
create table 
rhn_physical_location
(
    recid               number   (12)
        constraint rhn_phslc_recid_nn not null
        constraint rhn_phslc_recid_pk primary key
            using index tablespace [[2m_tbs]]
            storage( pctincrease 1 freelists 16 )
            initrans 32,
    location_name       varchar2 (40),
    address1            varchar2 (255),
    address2            varchar2 (255),
    city                varchar2 (128),
    state               varchar2 (128),
    country             varchar2 (2),
    zipcode             varchar2 (10),
    phone               varchar2 (40),
    deleted             char     (1),
    last_update_user    varchar2 (40),
    last_update_date    date,
    customer_id         number   (12)  default 999
        constraint rhn_phslc_cust_id_nn not null
)
    storage ( freelists 16 )
    initrans 32;

comment on table rhn_physical_location 
    is 'phslc  physical location records';

--NOTE: Had to shorten sequence name
create sequence rhn_physical_loc_recid_seq;

--$Log$
--Revision 1.3  2004/05/04 23:02:54  kja
--Fix syntax errors.  Trim constraint/table/sequence names to legal lengths.
--
--Revision 1.2  2004/04/30 20:45:21  kja
--Added missing sequence.
--
--Revision 1.1  2004/04/13 19:36:13  kja
--More monitoring schema.
--
