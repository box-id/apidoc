/**
 * Elixir
 */

const EX_TYPE = process.env.EX_TYPE || 'old';

const STANDARD_PARSER = {
  // Find document blocks between '#{' and '#}'
  docBlocksRegExp: /#*\s?\{\uffff?(.+?)\uffff?(?:\s*)?#+\s?\}/g,
  // Remove not needed '#' and tabs at the beginning
  inlineRegExp: /^(\s*)?(#*)[ ]?/gm,
};

const OLD_PARSER = {
  docBlocksRegExp: /@apidoc\s+("{3})\uffff?(.+?)\uffff?(?:\s*)?("{3})+\s?/g,
  inlineRegExp: /^@apidoc\s*\n/g,
};

module.exports = EX_TYPE === 'standard' ? STANDARD_PARSER : OLD_PARSER;
