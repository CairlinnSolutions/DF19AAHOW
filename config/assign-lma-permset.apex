//
// used to assign the EA integration user to the LMA permset
//
User u = [select id,name, username from User where IsActive=true and Name='Integration User' limit 1];
PermissionSet ps = [select id, name from PermissionSet where name = 'DF19_LMA' limit 1];
PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = ps.id, AssigneeId = u.id);
insert psa; 
