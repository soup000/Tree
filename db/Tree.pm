package Tree;

=head1 NAME

  Tree - module for Tree configuration

=head1 SYNOPSIS

  use Tree;
  my $Tree = Tree->new($db, $admin, \%conf);

=cut

use strict;
use parent 'main';
my ($admin, $CONF);


#*******************************************************************
#  Инициализация обьекта
#*******************************************************************
sub new {
  my $class = shift;
  my $db    = shift;
  ($admin, $CONF) = @_;

  my $self = {};
  bless($self, $class);

  $self->{db} = $db;
  $self->{admin} = $admin;
  $self->{conf} = $CONF;

  return $self;
}

#*******************************************************************
=head2 function add_type() - add tree type

  Arguments:
    %$attr
      TYPE_OF_TREE - type of tree

  Returns:
    $self object

  Examples:
    $Tree->add_type({
      TYPE_OF_TREE => $FORM{TYPE_OF_TREE},
    });

=cut

#*******************************************************************
sub add_type {
  my $self = shift;
  my ($attr) = @_;

  $self->query_add('trees_type', {%$attr});

  return $self;
}

#*******************************************************************

=head2 function del_type() - delete type from db
  Arguments:
    $attr

  Returns:

  Examples:
    $Tree->del_type( {ID => 1} );

=cut

#*******************************************************************
sub del_type{
  my $self = shift;
  my ($attr) = @_;

  $self->query_del('trees_type', $attr);

  return $self;
}


#**********************************************************

=head2 function type_list() - get type list

  Arguments:
    $attr
  Returns:
    @list

  Examples:
    my $list = $Tree->type_list({COLS_NAME=>1});

=cut

#**********************************************************
sub type_list {
  my $self = shift;
  my ($attr) = @_;

  my @WHERE_RULES = ();
  my $SORT        = ($attr->{SORT}) ? $attr->{SORT} : 1;
  my $DESC        = ($attr->{DESC}) ? $attr->{DESC} : '';

  $self->query2(
      "SELECT id, type_of_tree FROM trees_type",
      undef, $attr
  );

  return $self->{list};
}

#**********************************************************
=head2 function type_change() - change type

  Arguments:
    $attr
      ID            - type identifier;
      TYPE_OF_TREE  - type of tree;

  Returns:
    $self object

  Examples:
    $Tree->type_change({ ID           => 2,
                         TYPE_OF_TREE => "Вічнозелені",});

=cut
#**********************************************************
sub type_change {
  my $self = shift;
  my ($attr) = @_;

  $self->changes2(
      {
          CHANGE_PARAM => 'ID',
          TABLE        => 'trees_type',
          DATA         => $attr
      }
  );

  return $self;
}

#*******************************************************************
=head2 function add_species() - add tree species

  Arguments:
    %$attr
      TYPE_ID - ID of tree type
      SPECIES - species

  Returns:
    $self object

  Examples:
    $Tree->add_species({
      TYPE_ID => $FORM{TYPE_ID},
      SPECIES => $FORM{SPECIES},
    });

=cut

#*******************************************************************
sub add_species {
  my $self = shift;
  my ($attr) = @_;

  $self->query_add('trees_species', {%$attr});

  return $self;
}

#*******************************************************************

=head2 function del_species() - delete species from db
  Arguments:
    $attr

  Returns:

  Examples:
    $Tree->del_species( {ID => 1} );

=cut

#*******************************************************************
sub del_species {
  my $self = shift;
  my ($attr) = @_;

  $self->query_del('trees_species', $attr);

  return $self;
}


#**********************************************************

=head2 function species_list() - get species list

  Arguments:
    $attr
  Returns:
    @list

  Examples:
    my $list = $Tree->species_list({COLS_NAME=>1});

=cut

#**********************************************************
sub species_list {
  my $self = shift;
  my ($attr) = @_;

  my @WHERE_RULES = ();
  my $SORT        = ($attr->{SORT}) ? $attr->{SORT} : 1;
  my $DESC        = ($attr->{DESC}) ? $attr->{DESC} : '';

  $self->query2(
      "SELECT trees_species.id, type_of_tree, species, type_id FROM trees_species, trees_type WHERE type_id=trees_type.id",
      undef, $attr
  );

  return $self->{list};
}

#**********************************************************
=head2 function species_change() - change species

  Arguments:
    $attr
      ID      - species identifier;
      TYPE_ID - type of tree identifier;
      SPECIES - species;

  Returns:
    $self object

  Examples:
    $Tree->species_change({ ID      => 2,
                            TYPE_ID => 3,
                            SPECIES => "Береза"});

=cut
#**********************************************************
sub species_change {
  my $self = shift;
  my ($attr) = @_;

  $self->changes2(
      {
          CHANGE_PARAM => 'ID',
          TABLE        => 'trees_species',
          DATA         => $attr
      }
  );

  return $self;
}

#*******************************************************************
=head2 function add_tree() - add tree species

  Arguments:
    %$attr
      EXT_ID - external ID
      SPECIES_ID - species ID
      AGE - tree age
      COORD_X - geo coordinate
      COORD_Y - geo coordinate
      STATUS - tree status
      COMMENT - tree comment

  Returns:
    $self object

  Examples:
    $Tree->add_tree({
      EXT_ID     => $FORM{EXTID},
      SPECIES_ID => $FORM{SPECIES_ID},
      AGE        => $FORM{AGE},
      COORDX     => $FORM{COORDX},
      COORDY     => $FORM{COORDY},
      STATUS     => $FORM{STATUS},
      COMMENT    => $FORM{COMMENT},
    });

=cut

#*******************************************************************
sub add_tree {
  my $self = shift;
  my ($attr) = @_;

  $self->query_add('trees_tree', {%$attr});

  return $self;
}

#*******************************************************************

=head2 function del_tree() - delete tree from db
  Arguments:
    $attr

  Returns:

  Examples:
    $Tree->del_tree=> 1} );

=cut

#*******************************************************************
sub del_tree {
  my $self = shift;
  my ($attr) = @_;

  $self->query_del('trees_tree', $attr);

  return $self;
}

#**********************************************************
=head2 function tree_change() - change tree

  Arguments:
    Arguments:
    %$attr
      ID - tree ID
      EXT_ID - external ID
      SPECIES_ID - species ID
      AGE - tree age
      COORD_X - geo coordinate
      COORD_Y - geo coordinate
      STATUS - tree status
      COMMENT - tree comment

  Returns:
    $self object

  Examples:
    $Tree->tree_change({
      ID         => $FORM{ID},
      EXT_ID     => $FORM{EXTID},
      SPECIES_ID => $FORM{SPECIES_ID},
      AGE        => $FORM{AGE},
      COORDX     => $FORM{COORDX},
      COORDY     => $FORM{COORDY},
      STATUS     => $FORM{STATUS},
      COMMENT    => $FORM{COMMENT},
    });

=cut
#**********************************************************
sub tree_change {
  my $self = shift;
  my ($attr) = @_;

  $self->changes2(
      {
          CHANGE_PARAM => 'ID',
          TABLE        => 'trees_tree',
          DATA         => $attr
      }
  );

  return $self;
}

#**********************************************************

=head2 function tree_list() - show and search trees

  Arguments:
    $attr
      MIN_AGE
      MAX_AGE
      TYPE_ID
      SPECIES_ID
      STATUS
  Returns:
    @list

  Examples:
    my $list = $Tree->tree_list({COLS_NAME=>1});

=cut

#**********************************************************
sub tree_list {
  my $self = shift;
  my ($attr) = @_;

  my @WHERE_RULES = ();
  my $SORT        = ($attr->{SORT}) ? $attr->{SORT} : 1;
  my $DESC        = ($attr->{DESC}) ? $attr->{DESC} : '';
  #if (defined($attr->{TYPE_ID})) {
  #  push @WHERE_RULES, "trees_tree.='$attr->{SUBORDINATION}'";
  #}
  #push @WHERE_RULES, "trees_tree.species_id=trees_species.id AND trees_species.type_id=trees_type.id";
  if (defined($attr->{MIN_AGE})&& $attr->{MIN_AGE}!=0) {
    push @WHERE_RULES, "age>='$attr->{MIN_AGE}'";
  }
  if (defined($attr->{MAX_AGE})&& $attr->{MAX_AGE}!=0) {
    push @WHERE_RULES, "age<='$attr->{MAX_AGE}'";
  }
  if (defined($attr->{TYPE_ID})&& $attr->{TYPE_ID}!=0) {
    push @WHERE_RULES, "(SELECT type_id FROM trees_species WHERE id=species_id)='$attr->{TYPE_ID}'";
  }
  if (defined($attr->{SPECIES_ID})&& $attr->{SPECIES_ID}!=0) {
    push @WHERE_RULES, "species_id='$attr->{SPECIES_ID}'";
  }
  if (defined($attr->{STATUS})&& $attr->{STATUS} ne "") {
    push @WHERE_RULES, "status='$attr->{STATUS}'";
  }

  my $WHERE = $self->search_former($attr, [],
      { WHERE       => 1,
          WHERE_RULES => \@WHERE_RULES
      });
  $self->query2(
      "SELECT tr.id,
          tr.ext_id,
          tr.species_id,
          tr.age,
          tr.coordx,
          tr.coordy,
          tr.status,
          tr.comment,
          (SELECT species FROM trees_species WHERE id=species_id) AS species,
          (SELECT type_id FROM trees_species WHERE id=species_id) AS type_id,
          (SELECT type_of_tree FROM trees_type WHERE id=type_id)  AS type_of_tree
          FROM
          trees_tree AS tr
          $WHERE
          ORDER BY $SORT $DESC",
      undef, $attr
  );

  return $self->{list};
}

1;
