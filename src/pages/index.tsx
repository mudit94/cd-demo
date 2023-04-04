import HelloName from '../components/HelloName';

export async function getServerSideProps() {
  const name = process.env.NAME;
  return { props: { name } };
}

export default function Index({ name }: { name: string }) {
  return <HelloName name={name} />;
}
