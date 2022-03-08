export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'bubble_sort' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Vec(IDL.Nat)], []),
    'capitalize_character' : IDL.Func([IDL.Nat32], [IDL.Nat32], []),
    'capitalize_text' : IDL.Func([IDL.Text], [IDL.Text], []),
    'decimal_to_bits' : IDL.Func([IDL.Nat], [IDL.Text], []),
    'duplicated_character' : IDL.Func([IDL.Text], [IDL.Text], []),
    'is_inside' : IDL.Func([IDL.Text, IDL.Nat32], [IDL.Bool], []),
    'max_number_with_n_bits' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'nat_to_nat8' : IDL.Func([IDL.Nat], [IDL.Nat8], []),
    'size_in_bytes' : IDL.Func([IDL.Text], [IDL.Nat], []),
    'trim_whitespace' : IDL.Func([IDL.Text], [IDL.Text], []),
    'unicode_to_character' : IDL.Func([IDL.Nat32], [IDL.Text], []),
  });
};
export const init = ({ IDL }) => { return []; };
