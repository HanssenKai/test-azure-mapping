local claims = {
  email_verified: false
} + std.extVar('claims');

local fName = if "given_name" in claims && claims.given_name != null then claims.given_name else "Azure";
local lName = if "family_name" in claims && claims.family_name != null then claims.family_name else "User";

{
  identity: {
    traits: {
      [if "email" in claims && claims.email_verified then "email" else null]: claims.email,
      first_name: fName,
      last_name: lName,
    },
  },
}
